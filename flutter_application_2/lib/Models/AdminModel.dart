import 'package:flutter/material.dart';
class AdminModel
{ String? FullName;
  String? Authid;
  String? Email;
  String? Password;
  bool? AddAdmin;

  AdminModel({this.FullName,this.Authid,this.Email,this.Password,this.AddAdmin=false});

  Map<String, dynamic> toMap(AdminModel model) {
    return {
      'FullName': this.FullName,
      'Authid': this.Authid,
      'Email': this.Email,
      'Password': this.Password,
      'AddAdmin': this.AddAdmin,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      FullName: map['FullName'] as String,
      Authid: map['Authid'] as String,
      Email: map['Email'] as String,
      Password: map['Password'] as String,
      AddAdmin: map['AddAdmin'] as bool,
    );
  }

  AdminModel copyWith({
    String? FullName,
    String? Authid,
    String? Email,
    String? Password,
    bool? AddAdmin,
  }) {
    return AdminModel(
      FullName: FullName?? this.FullName,
      Authid: Authid ?? this.Authid,
      Email: Email ?? this.Email,
      Password: Password ?? this.Password,
      AddAdmin: AddAdmin ?? this.AddAdmin,
    );
  }


}
