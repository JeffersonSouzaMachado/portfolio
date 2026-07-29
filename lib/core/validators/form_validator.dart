String? validateName(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Informe seu nome';
  }

  if (text.length < 2) {
    return 'Verifique o nome';
  }

  return null;
}

String? validateLastName(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Informe seu sobrenome';
  }

  if (text.length < 2) {
    return 'Verifique o sobrenome';
  }

  return null;
}

String? validateEmail(String? value) {
  final email = value?.trim() ?? '';

  if (email.isEmpty) {
    return 'Informe seu e-mail';
  }

  final emailRegex = RegExp(
    r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
  );

  if (!emailRegex.hasMatch(email)) {
    return 'Informe um e-mail válido';
  }

  return null;
}

String? validateSubject(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Informe o assunto';
  }

  if (text.length < 3) {
    return 'O assunto deve ter pelo menos 3 caracteres';
  }

  return null;
}

String? validateMessage(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Digite uma mensagem';
  }

  if (text.length < 10) {
    return 'A mensagem deve ter pelo menos 10 caracteres';
  }

  return null;
}