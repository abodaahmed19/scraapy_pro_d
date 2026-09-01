class ExportDangerWasteModel {
  final String facilityType;
  final String commercialRegister;
  final String nationalAddress;
  final String facilityProof;
  final String zakatCertificate;
  final String mwanLicenseNumber;

  final String wasteType;
  final String baselApproval;
  final String riskReport;
  final String labReport;
  final String manifestDocument;
  final bool usageCommitment;

  final String logisticsDescription;
  final String carrierLicenseNumber;
  final String collectionTransportMethod;
  final String vehiclesAndDriversFile;
  final String temporaryStorageContract;

  final String emergencyPlan;
  final String noLocalAlternativeProof;
  final bool modificationAck;

  final List<ProductModel> products;

  const ExportDangerWasteModel({
    required this.facilityType,
    required this.commercialRegister,
    required this.nationalAddress,
    required this.facilityProof,
    required this.zakatCertificate,
    required this.mwanLicenseNumber,
    required this.wasteType,
    required this.baselApproval,
    required this.riskReport,
    required this.labReport,
    required this.manifestDocument,
    required this.usageCommitment,
    required this.logisticsDescription,
    required this.carrierLicenseNumber,
    required this.collectionTransportMethod,
    required this.vehiclesAndDriversFile,
    required this.temporaryStorageContract,
    required this.emergencyPlan,
    required this.noLocalAlternativeProof,
    required this.modificationAck,
    required this.products,
  });

  factory ExportDangerWasteModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ExportDangerWasteModel(
      facilityType: json['facility_type'] as String,
      commercialRegister: json['commercial_register'] as String,
      nationalAddress: json['national_address'] as String,
      facilityProof: json['facility_proof'] as String,
      zakatCertificate: json['zakat_certificate'] as String,
      mwanLicenseNumber: json['mwan_license_number'] as String,

      wasteType: json['waste_type'] as String,
      baselApproval: json['basel_approval'] as String,
      riskReport: json['risk_report'] as String,
      labReport: json['lab_report'] as String,
      manifestDocument: json['manifest_document'] as String,
      usageCommitment: json['usage_commitment'] as bool,

      logisticsDescription: json['logistics_description'] as String,
      carrierLicenseNumber:
      json['carrier_license_number'] as String,
      collectionTransportMethod:
      json['collection_transport_method'] as String,
      vehiclesAndDriversFile:
      json['vehicles_and_drivers_file'] as String,
      temporaryStorageContract:
      json['temporary_storage_contract'] as String,

      emergencyPlan: json['emergency_plan'] as String,
      noLocalAlternativeProof:
      json['no_local_alternative_proof'] as String,
      modificationAck: json['modification_ack'] as bool,

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
      'basel_approval': baselApproval,
      'risk_report': riskReport,
      'lab_report': labReport,
      'manifest_document': manifestDocument,
      'usage_commitment': usageCommitment,

      'logistics_description': logisticsDescription,
      'carrier_license_number': carrierLicenseNumber,
      'collection_transport_method': collectionTransportMethod,
      'vehicles_and_drivers_file': vehiclesAndDriversFile,
      'temporary_storage_contract': temporaryStorageContract,

      'emergency_plan': emergencyPlan,
      'no_local_alternative_proof': noLocalAlternativeProof,
      'modification_ack': modificationAck,

      'products': products.map((product) => product.toJson()).toList(),
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