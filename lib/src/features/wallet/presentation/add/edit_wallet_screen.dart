import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
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
          SizedBox(
            width: double.infinity,
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
