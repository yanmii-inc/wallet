// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class EditWalletDialog extends ConsumerStatefulWidget {
  const EditWalletDialog({
    required this.wallet,
    super.key,
    this.onSaved,
  });

  final WalletEntity wallet;
  final void Function(String? logo, String name)? onSaved;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditWalletDialogState();
}

class _EditWalletDialogState extends ConsumerState<EditWalletDialog> {
  final _nameController = TextEditingController();
  File? _image;

  @override
  void initState() {
    _nameController.text = widget.wallet.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PickImage(
            image: widget.wallet.logo,
            onImageSet: (image) {
              _image = image;
            },
          ),
          Gap.h24,
          CommonTextfield(
            controller: _nameController,
            label: 'Nama'.hardcoded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),
          Gap.h16,
          Row(
            children: [
              CommonButton.withIcon(
                'Hapus'.hardcoded,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final transactionCount = await ref
                      .read(walletControllerProvider.notifier)
                      .checkTransaction(widget.wallet);
                  if (transactionCount > 0 && mounted) {
                    final confirmed = await showModalBottomSheet<bool>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return _TransactionDeletionAlert(
                              wallet: widget.wallet,
                              transactionCount: transactionCount,
                            );
                          },
                        );
                      },
                    );

                    if ((confirmed ?? false) && mounted) {
                      context.pop();
                    }
                  } else {
                    await ref
                        .read(walletControllerProvider.notifier)
                        .deleteWallet(widget.wallet);
                    context.pop();
                  }
                },
              ),
              Gap.w16,
              Expanded(
                child: CommonButton.withIcon(
                  'Simpan'.hardcoded,
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    widget.onSaved?.call(
                      _image?.path,
                      _nameController.text,
                    );
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionDeletionAlert extends ConsumerStatefulWidget {
  const _TransactionDeletionAlert({
    required this.wallet,
    required this.transactionCount,
  });

  final int transactionCount;
  final WalletEntity wallet;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionDeletionAlertState();
}

class _TransactionDeletionAlertState
    extends ConsumerState<_TransactionDeletionAlert> {
  DeletionActions? selected;

  @override
  Widget build(BuildContext context) {
    final isDisabled = selected == null;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Gap.h16,
          Icon(Icons.warning_amber, color: Colors.orange.shade700, size: 64),
          Gap.h20,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Ada '.hardcoded,
              style: context.textTheme.titleMedium,
              children: [
                TextSpan(
                  text: '${widget.transactionCount} transaksi'.hardcoded,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.red),
                ),
                TextSpan(
                  text: ' dengan wallet ini!'.hardcoded,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Gap.h16,
          RadioMenuButton(
            value: DeletionActions.moveToAnotherWallet,
            groupValue: selected,
            onChanged: (value) => setState(() {
              selected = value;
            }),
            child: Text(DeletionActions.moveToAnotherWallet.message),
          ),
          RadioMenuButton(
            value: DeletionActions.softDelete,
            groupValue: selected,
            onChanged: (value) => setState(() {
              selected = value;
            }),
            child: Text(
              DeletionActions.softDelete.message,
              maxLines: 2,
            ),
          ),
          RadioMenuButton(
            value: DeletionActions.hardDelete,
            groupValue: selected,
            onChanged: (value) => setState(() {
              selected = value;
            }),
            child: Text(DeletionActions.hardDelete.message),
          ),
          Gap.h16,
          Row(
            children: [
              CommonButton.withIcon(
                'Batal'.hardcoded,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                onPressed: () => context.pop(false),
              ),
              Gap.w16,
              Expanded(
                child: CommonButton.withIcon(
                  'Hapus'.hardcoded,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  isDisabled: isDisabled,
                  backgroundColor: !isDisabled ? Colors.red : null,
                  textColor: Colors.white,
                  onPressed: () {
                    ref
                        .read(walletControllerProvider.notifier)
                        .deleteWallet(widget.wallet, action: selected);
                    context.pop(true);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PickImage extends StatefulWidget {
  const PickImage({
    super.key,
    this.image,
    this.onImageSet,
  });

  final String? image;
  final void Function(File image)? onImageSet;

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _image;

  @override
  void initState() {
    if (widget.image != null) {
      _image = File(widget.image!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(24),
        image: (_image != null)
            ? DecorationImage(
                image: FileImage(_image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: InkWell(
        onTap: () async {
          final picker = ImagePicker();
          final image = await picker.pickImage(source: ImageSource.gallery);
          setState(() {
            if (image != null) {
              _image = File(image.path);
              widget.onImageSet?.call(_image!);
            } else {
              _image = null;
            }
          });
        },
        child: const Center(child: Icon(Icons.add_a_photo)),
      ),
    );
  }
}
