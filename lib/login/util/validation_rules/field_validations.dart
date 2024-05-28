mixin FieldValidationMixin {
  final validEmailFormatation = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final validPasswordFormatation = RegExp(r'^(?=.*\d)(?=\S{5,}$).*$');

  String? isNotNull(String? value, [String? message]) {
    if (value == null) {
      return message ?? "Este campo é obrigatório";
    }
    return null;
  }

  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) {
      return message ?? "Este campo é obrigatório";
    }
    return null;
  }

  String? isNotValidEmail(String? value, [String? message]) {
    if (!validEmailFormatation.hasMatch(value!)) {
      return 'Email inválido';
    }
    return null;
  }

  String? isNotValidPassword(String? value, [String? message]) {
    if (!validPasswordFormatation.hasMatch(value!)) {
      return 'Senha inválida';
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
