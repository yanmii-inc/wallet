part of '../report_screen.dart';

class ReportSettingsDialog extends ConsumerWidget {
  const ReportSettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog.adaptive(
      title: Text('Settings', style: context.titleMedium),
      content: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text('Tanggal mulai'.hardcoded)),
                Gap.w8,
                DropdownMenu<int>(
                  width: 100,
                  initialSelection:
                      ref.watch(monthlySettingControllerProvider).startDate,
                  inputDecorationTheme: context.theme.inputDecorationTheme,
                  enableFilter: true,
                  dropdownMenuEntries: List.generate(30, (index) => index + 1)
                      .map(
                        (e) => DropdownMenuEntry(
                          value: e,
                          label: e.toString(),
                        ),
                      )
                      .toList(),
                  onSelected: (value) {
                    if (value == null) return;
                    ref
                        .read(monthlySettingControllerProvider.notifier)
                        .setStartDate(value: value);
                  },
                ),
              ],
            ),
            Gap.h16,
            Row(
              children: [
                Text('Tampilkan saldo kumulatif'.hardcoded).expand,
                Switch(
                  value: ref
                      .watch(monthlySettingControllerProvider)
                      .showCumulativeBalance,
                  onChanged: (value) async {
                    await ref
                        .read(monthlySettingControllerProvider.notifier)
                        .setShowCumulativeBalance(value: value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            context.pop(true);
            await ref.read(monthlySettingControllerProvider.notifier).save();

            await ref
                .read(monthlyControllerProvider.notifier)
                .getMonthlyRecaps();
            ref.invalidate(monthlySettingControllerProvider);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
