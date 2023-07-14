// ignore_for_file: unnecessary_new, curly_braces_in_flow_control_structures


mixin Validators {
  String? validateBankName(String? name) {
    if (name!.trim().isEmpty) {
      return "Bank can't be empty";
    }
    return null;
  }

  String? validateBankNumber(String? name) {
    if (name!.trim().isEmpty) {
      return "Account Number can't be empty";
    }
    return null;
  }

  String? validateDocumentNumber(String? number) {
    if (number!.trim().isEmpty) {
      return "Please enter document number";
    }
    return null;
  }

  String? validateCode(String? name) {
    if (name!.trim().isEmpty) {
      return "Code can't be empty";
    }
    return null;
  }

  String? validatePilicyHolderName(String? name) {
    if (name!.trim().isEmpty) {
      return "Please enter policy holder name";
    }
    return null;
  }

  String? validatePolicy(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select your policy";
    }
    return null;
  }

  String? validateSegment(String? name) {
    if (name!.trim().isEmpty) {
      return "Please enter segment ";
    }
    return null;
  }

  String? validateinsuranceCompany(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select insurance company ";
    }
    return null;
  }

  String? validateTargetFactor(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select target factor ";
    }
    return null;
  }

  String? validateDivision(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select Division ";
    }
    return null;
  }

  String? validateMode(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select mode";
    }
    return null;
  }

  String? validateEmailForm(String? email) {
    if ((email ?? "").trim().isEmpty) return "Email can't be empty";
    return validateEmail(email ?? "")
        ? null
        : "Please enter a valid email address";
  }

  validateEmail(String? email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(email!.trim())) {
      return false;
    } else {
      return true;
    }
  }

  // bool isEmailValidate(String email) {
  //   if (EmailValidator.validate(email)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  String? validateUserForm(String? name) {
    if (name!.trim().isEmpty) {
      return "Name can't be empty";
    }

    return null;
  }

  validateUsername(String? username) {
    Pattern pattern = r'^[a-z0-9_.]+$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(username!.trim())) {
      return false;
    } else {
      return true;
    }
  }

  String? validatePhone(String? phone) {
    if ((phone ?? "").trim().isEmpty) return "Phone number can't be empty";
    if ((phone ?? "").trim().length < 10)
      return "Please enter valid 10 digit phone number";
    return null;
  }

  String? validatePhoneNumberForm(String? phone) {
    if (phone!.isNotEmpty && phone.trim().length < 10)
      return "Please enter valid 10 digit phone number";
    return null;
  }

  String? validatePassword(String? password) {
    if ((password ?? "").trim().isEmpty) {
      return "Password can't be empty";
    } else if ((password ?? "").trim().length <= 7) {
      return "Password character length must be atleast 8";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String confirmPassword, String? newPassword) {
    if (confirmPassword.trim().isEmpty) {
      return "Confirm password can't be empty";
    } else if (confirmPassword.trim() != newPassword?.trim()) {
      return "Password doesn't match";
    }
    return null;
  }

  String? validateFamilyGroup(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select family group.";
    }
    return null;
  }

  String? validateFamilyHead(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select family head.";
    }
    return null;
  }

  String? validateFamilyMember(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select family member.";
    }
    return null;
  }

  String? validateFirstName(String? name) {
    if (name!.trim().isEmpty) {
      return "The member first name field is reqiured.";
    }
    return null;
  }

  String? validateCurrentPolicy(String? name) {
    if (name!.trim().isEmpty) {
      return "Please enter current policy number..";
    }
    return null;
  }

  String? validateVehicleNumber(String? name) {
    if (name!.trim().isEmpty) {
      return "Please enter vehicle number..";
    }
    return null;
  }

  String? validateVehicleName(String? name) {
    if (name!.trim().isEmpty) {
      return "Please enter vehicle name..";
    }
    return null;
  }

  String? validateAgencyLevel(String? name) {
    if (name!.trim().isEmpty) {
      return "Please select egency level";
    }
    return null;
  }

  String? validateMiddleName(String? name) {
    if (name!.trim().isEmpty) {
      return "The member middle name field is reqiured.";
    }
    return null;
  }

  String? validatelastName(String? name) {
    if (name!.trim().isEmpty) {
      return "The member last name field is reqiured.";
    }
    return null;
  }

  String? otherField(String? pwd) {
    if (pwd!.trim().isEmpty) return "Field can't be empty";
    return null;
  }

  String? validateFullName(String? name) {
    if ((name ?? "").trim().isEmpty) return "Full name can't be empty";
    return null;
  }

  String? validateDOB(String? dob) {
    if ((dob ?? "").trim().isEmpty) return "Please fill DOB";
    return null;
  }

  String? validateRiskFrom(String? dob) {
    if ((dob ?? "").trim().isEmpty) return "Please fill Date";
    return null;
  }

  String? validateGender(String? gender) {
    if ((gender ?? "").trim().isEmpty) return "Please select Gender";
    return null;
  }

  String? validateBasicPremium(String? gender) {
    if ((gender ?? "").trim().isEmpty)
      return "Please enter basic premium ammount";
    return null;
  }

  String? validateTotalPremium(String? gender) {
    if ((gender ?? "").trim().isEmpty)
      return "Please enter total premium ammount";
    return null;
  }

  String? validateCity(String? city) {
    if ((city ?? "").trim().isEmpty) return "Please select city";
    return null;
  }

  String? validateArea(String? area) {
    if ((area ?? "").trim().isEmpty) return "Please select area";
    return null;
  }

  String? validateBusinessType(String? business) {
    if ((business ?? "").trim().isEmpty) return "Please select business type";
    return null;
  }

  String? validateMarriageStatus(String? marriage) {
    if ((marriage ?? "").trim().isEmpty) return "Please select marriage status";
    return null;
  }

  String? validateAddress(String? address) {
    if ((address ?? "").trim().isEmpty)
      return "The member address field is required.";
    return null;
  }

  String? validateFirmName(String? name) {
    if ((name ?? "").trim().isEmpty) return "The firm name field is required.";
    return null;
  }

  String? validateState(String? city) {
    if ((city ?? "").trim().isEmpty) return "Please select state";
    return null;
  }

  String? validateCountry(String? city) {
    if ((city ?? "").trim().isEmpty) return "Please select country";
    return null;
  }

  String? validateZipCode(String? city) {
    if ((city ?? "").trim().isEmpty) return "Please select zip code";
    return null;
  }

  String? validateRequired(String? required) {
    if ((required ?? "").trim().isEmpty) return "Required Field";
    return null;
  }

  String? validateCardNumberForm(String? creditCard) {
    if ((creditCard ?? "").trim().isEmpty) return "Required Field";
    return validateEmail(creditCard ?? "") ? null : "Invalid Card Number";
  }
}
