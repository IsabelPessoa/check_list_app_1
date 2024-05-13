mixin EmailValidationMixin {
  final validFormatation = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? isNotEmpty(String? value, [String? message]) {
    if (value == null) return message ?? "Este campo é obrigatório";
    return null;
  }

  String? isNotValid(String? value, [String? message]) {
    if (validFormatation.hasMatch(value!)) {
      return 'Email inválido';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
