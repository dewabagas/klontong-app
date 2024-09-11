String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nama harus diisi';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'No. Handphone harus diisi';
  } else if (value.length < 7 || value.length > 13) {
    return 'No. Handphone harus antara 7 dan 13 angka';
  } else if (value.startsWith('0')) {
    return 'No. Handphone tidak boleh diawali dengan angka 0';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email harus diisi';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Format email tidak valid';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password harus diisi';
  } else if (value.length < 8 ||
      !RegExp(r'[0-9]').hasMatch(value) ||
      !RegExp(r'[A-Za-z]').hasMatch(value)) {
    return 'Password harus minimal 8 karakter dan kombinasi angka & huruf';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Konfirmasi Password harus diisi';
  } else if (value != password) {
    return 'Konfirmasi Password tidak sesuai';
  }
  return null;
}
