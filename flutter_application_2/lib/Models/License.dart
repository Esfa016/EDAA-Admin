class License
{
  String fullName;
  String occupation;
  String licenseId;
  String email;
  String phone;
  String  issueDate;
  String expiryDate;
  String imgUrl;
  String uid;
  String address;
  String subCity;
  String woreda;
  String houseNumber;

  String status;

  License({
    required this.fullName,
    required this.occupation,
    required this.licenseId,
    required this.email,
    required this.phone,
    required this.issueDate,
    required this.expiryDate,
    required this.imgUrl,
    required this.uid,
    required this.subCity,
    required this.address,
    required this.woreda,
    required this.houseNumber,
    required this.status
  });

  Map<String, dynamic> toMap(License myLicense) {
    return {
      'FullName': fullName,
      'Occupation': occupation,
      'LicenseId': licenseId,
      'Email': email,
      'Phone': phone,
      'IssueDate': issueDate,
      'ExpiryDate': expiryDate,
      'imgUrl': imgUrl,
      'uid': uid,
      'SubCity':subCity,
      'Address': address,
      'Woreda': woreda,
      'HouseNumber': houseNumber,
      'Status': status
    };
  }
}