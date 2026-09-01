class ExportNondangerWasteModel {
  final String facilityType;
  final String commercialRegister;
  final String nationalAddress;
  final String facilityProof;
  final String zakatCertificate;
  final String mwanLicenseNumber;

  final String wasteType;
  final String wasteImage;
  final String marketProof;
  final bool recyclingCommitment;

  final String logisticsDescription;
  final String carrierLicenseNumber;
  final String collectionTransportMethod;
  final String temporaryStorageFacility;

  final bool vehicleComplianceAck;
  final bool modificationAck;

  final List<ProductModel> products;

  const ExportNondangerWasteModel({
    required this.facilityType,
    required this.commercialRegister,
    required this.nationalAddress,
    required this.facilityProof,
    required this.zakatCertificate,
    required this.mwanLicenseNumber,
    required this.wasteType,
    required this.wasteImage,
    required this.marketProof,
    required this.recyclingCommitment,
    required this.logisticsDescription,
    required this.carrierLicenseNumber,
    required this.collectionTransportMethod,
    required this.temporaryStorageFacility,
    required this.vehicleComplianceAck,
    required this.modificationAck,
    required this.products,
  });

  factory ExportNondangerWasteModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ExportNondangerWasteModel(
      facilityType: json['facility_type'] as String,
      commercialRegister: json['commercial_register'] as String,
      nationalAddress: json['national_address'] as String,
      facilityProof: json['facility_proof'] as String,
      zakatCertificate: json['zakat_certificate'] as String,
      mwanLicenseNumber: json['mwan_license_number'] as String,

      wasteType: json['waste_type'] as String,
      wasteImage: json['waste_image'] as String,
      marketProof: json['market_proof'] as String,
      recyclingCommitment:
      json['recycling_commitment'] as bool,

      logisticsDescription:
      json['logistics_description'] as String,
      carrierLicenseNumber:
      json['carrier_license_number'] as String,
      collectionTransportMethod:
      json['collection_transport_method'] as String,
      temporaryStorageFacility:
      json['temporary_storage_facility'] as String,

      vehicleComplianceAck:
      json['vehicle_compliance_ack'] as bool,
      modificationAck:
      json['modification_ack'] as bool,

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
      'mwan_license_number': mwanLicenseNumber,

      'waste_type': wasteType,
      'waste_image': wasteImage,
      'market_proof': marketProof,
      'recycling_commitment': recyclingCommitment,

      'logistics_description': logisticsDescription,
      'carrier_license_number': carrierLicenseNumber,
      'collection_transport_method': collectionTransportMethod,
      'temporary_storage_facility': temporaryStorageFacility,

      'vehicle_compliance_ack': vehicleComplianceAck,
      'modification_ack': modificationAck,

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
      salesCount: (json['sales_count'] as num).toInt(),
      image: json['image'] as String?,
      quantity: (json['quantity'] as num).toInt(),
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