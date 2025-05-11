-- Create auth schema for profiles
create table public.profiles (
  id uuid references auth.users on delete cascade not null primary key,
  email text,
  full_name text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on profiles
alter table public.profiles enable row level security;

-- Create policy to allow users to read their own profile
create policy "Users can read own profile"
  on public.profiles for select
  using ( auth.uid() = id );

-- Create policy to allow users to update their own profile
create policy "Users can update own profile"
  on public.profiles for update
  using ( auth.uid() = id );

-- Wallets table with user ownership
create table public.wallets (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  name text not null,
  logo text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on wallets
alter table public.wallets enable row level security;

-- Create policy for wallet access
create policy "Users can CRUD own wallets"
  on public.wallets for all
  using ( auth.uid() = user_id );

-- Categories table with user ownership
create table public.categories (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  label text not null,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on categories
alter table public.categories enable row level security;

-- Create policy for category access
create policy "Users can CRUD own categories"
  on public.categories for all
  using ( auth.uid() = user_id );

-- Transactions table with user ownership
create table public.transactions (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  date text,
  wallet_id bigint references public.wallets(id) on delete set null,
  dest_wallet_id bigint references public.wallets(id) on delete set null,
  amount decimal not null,
  title text not null,
  category_id bigint references public.categories(id) on delete set null,
  description text,
  type text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on transactions
alter table public.transactions enable row level security;

-- Create policy for transaction access
create policy "Users can CRUD own transactions"
  on public.transactions for all
  using ( auth.uid() = user_id );

-- Custom recaps table with user ownership
create table public.custom_recaps (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  title text not null,
  start_date text not null,
  end_date text not null,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on custom_recaps
alter table public.custom_recaps enable row level security;

-- Create policy for custom_recaps access
create policy "Users can CRUD own custom_recaps"
  on public.custom_recaps for all
  using ( auth.uid() = user_id );

-- Loans table with user ownership
create table public.loans (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  date text,
  wallet_id bigint references public.wallets(id) on delete set null,
  amount decimal not null,
  name text not null,
  description text,
  type text not null,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on loans
alter table public.loans enable row level security;

-- Create policy for loans access
create policy "Users can CRUD own loans"
  on public.loans for all
  using ( auth.uid() = user_id );

-- Loan payments table with user ownership
create table public.loan_payments (
  id bigint primary key generated always as identity,
  user_id uuid references public.profiles(id) on delete cascade not null,
  date text,
  wallet_id bigint references public.wallets(id) on delete set null,
  loan_id bigint references public.loans(id) on delete cascade,
  amount decimal not null,
  note text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS on loan_payments
alter table public.loan_payments enable row level security;

-- Create policy for loan_payments access
create policy "Users can CRUD own loan_payments"
  on public.loan_payments for all
  using ( auth.uid() = user_id );

-- Create function to handle user creation
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, full_name)
  values (new.id, new.email, new.raw_user_meta_data->>'full_name');
  return new;
end;
$$ language plpgsql security definer;

-- Create trigger for new user creation
create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
