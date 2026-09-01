class ImportNondangerWasteModel {
  final String facilityType;
  final String commercialRegister;
  final String nationalAddress;
  final String facilityProof;
  final String zakatCertificate;
  final String nationalCenterLicenseNumber;

  final String wasteType;
  final String wasteImages;
  final String marketNeed;
  final bool recyclingCommitment;

  final String carrierLicenseNumber;
  final String temporaryStorageLicense;
  final String recyclingFacilities;

  final bool additionalRequirementsAck;

  final List<ProductModel> products;

  const ImportNondangerWasteModel({
    required this.facilityType,
    required this.commercialRegister,
    required this.nationalAddress,
    required this.facilityProof,
    required this.zakatCertificate,
    required this.nationalCenterLicenseNumber,
    required this.wasteType,
    required this.wasteImages,
    required this.marketNeed,
    required this.recyclingCommitment,
    required this.carrierLicenseNumber,
    required this.temporaryStorageLicense,
    required this.recyclingFacilities,
    required this.additionalRequirementsAck,
    required this.products,
  });

  factory ImportNondangerWasteModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ImportNondangerWasteModel(
      facilityType: json['facility_type'] as String,
      commercialRegister: json['commercial_register'] as String,
      nationalAddress: json['national_address'] as String,
      facilityProof: json['facility_proof'] as String,
      zakatCertificate: json['zakat_certificate'] as String,
      nationalCenterLicenseNumber:
      json['national_center_license_number'] as String,

      wasteType: json['waste_type'] as String,
      wasteImages: json['waste_images'] as String,
      marketNeed: json['market_need'] as String,
      recyclingCommitment:
      json['recycling_commitment'] as bool,

      carrierLicenseNumber:
      json['carrier_license_number'] as String,
      temporaryStorageLicense:
      json['temporary_storage_license'] as String,
      recyclingFacilities:
      json['recycling_facilities'] as String,

      additionalRequirementsAck:
      json['additional_requirements_ack'] as bool,

      products: (json['products'] as List)
          .map(
            (item) => ProductModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facility_type': facilityType,
      'commercial_register': commercialRegister,
      'national_address': nationalAddress,
      'facility_proof': facilityProof,
      'zakat_certificate': zakatCertificate,
      'national_center_license_number':
      nationalCenterLicenseNumber,

      'waste_type': wasteType,
      'waste_images': wasteImages,
      'market_need': marketNeed,
      'recycling_commitment': recyclingCommitment,

      'carrier_license_number': carrierLicenseNumber,
      'temporary_storage_license': temporaryStorageLicense,
      'recycling_facilities': recyclingFacilities,

      'additional_requirements_ack':
      additionalRequirementsAck,

      'products': products
          .map((product) => product.toJson())
          .toList(),
    };
  }
}

class ProductModel {
  final String name;
  final String hsCode;
  final String ownerName;
  final int salesCount;
  final String? image;
  final int quantity;
  final double price;

  const ProductModel({
    required this.name,
    required this.hsCode,
    required this.ownerName,
    required this.salesCount,
    this.image,
    required this.quantity,
    required this.price,
  });

  factory ProductModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProductModel(
      name: json['name'] as String,
      hsCode: json['hs_code'] as String,
      ownerName: json['owner_name'] as String,
      salesCount: json['sales_count'] as int,
      image: json['image'] as String?,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'hs_code': hsCode,
      'owner_name': ownerName,
      'sales_count': salesCount,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}