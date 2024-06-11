import 'package:flutter/material.dart';
import '../core/app_export.dart'; // Ensure you have the right exports for themes and constants.

class CustomDropdownFormField<T> extends StatelessWidget {
  CustomDropdownFormField({
    Key? key,
    this.alignment,
    this.width,
    this.height,
    this.scrollPadding,
    this.value,
    this.items,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator, required double borderRadius,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final double? height;
  final EdgeInsets? scrollPadding;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: dropdownFormFieldWidget(context))
        : dropdownFormFieldWidget(context);
  }

  Widget dropdownFormFieldWidget(BuildContext context) => Container(
    width: width ?? double.maxFinite,
    height: height ?? 48.v,  // Default height
    padding: scrollPadding ??
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    decoration: BoxDecoration(
      color: fillColor ?? theme.colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(12.h),

    ),
    child: DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.titleSmall,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
        border: InputBorder.none, // Ensure no border is visible
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}
