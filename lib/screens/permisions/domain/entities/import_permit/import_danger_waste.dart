class ImportDangerWasteModel {
  final String facilityType;
  final String commercialRegister;
  final String nationalAddress;
  final String facilityProof;
  final String zakatCertificate;
  final String nationalCenterLicenseNumber;

  final String wasteType;
  final String baselAgreementApproval;
  final String materialRiskReport;
  final String labReport;
  final bool industrialUseCommitment;

  final String logisticsDescription;
  final String collectionTransportMethod;
  final String carrierLicenseNumber;
  final String temporaryStorageFacility;

  final String emergencyPlan;
  final String marketNeedProof;
  final bool categoryComplianceAck;
  final bool modificationAck;

  final List<ProductModel> products;

  const ImportDangerWasteModel({
    required this.facilityType,
    required this.commercialRegister,
    required this.nationalAddress,
    required this.facilityProof,
    required this.zakatCertificate,
    required this.nationalCenterLicenseNumber,
    required this.wasteType,
    required this.baselAgreementApproval,
    required this.materialRiskReport,
    required this.labReport,
    required this.industrialUseCommitment,
    required this.logisticsDescription,
    required this.collectionTransportMethod,
    required this.carrierLicenseNumber,
    required this.temporaryStorageFacility,
    required this.emergencyPlan,
    required this.marketNeedProof,
    required this.categoryComplianceAck,
    required this.modificationAck,
    required this.products,
  });

  factory ImportDangerWasteModel.fromJson(Map<String, dynamic> json) {
    return ImportDangerWasteModel(
      facilityType: json['facility_type'] as String,
      commercialRegister: json['commercial_register'] as String,
      nationalAddress: json['national_address'] as String,
      facilityProof: json['facility_proof'] as String,
      zakatCertificate: json['zakat_certificate'] as String,
      nationalCenterLicenseNumber:
      json['national_center_license_number'] as String,

      wasteType: json['waste_type'] as String,
      baselAgreementApproval:
      json['basel_agreement_approval'] as String,
      materialRiskReport: json['material_risk_report'] as String,
      labReport: json['lab_report'] as String,
      industrialUseCommitment:
      json['industrial_use_commitment'] as bool,

      logisticsDescription:
      json['logistics_description'] as String,
      collectionTransportMethod:
      json['collection_transport_method'] as String,
      carrierLicenseNumber:
      json['carrier_license_number'] as String,
      temporaryStorageFacility:
      json['temporary_storage_facility'] as String,

      emergencyPlan: json['emergency_plan'] as String,
      marketNeedProof: json['market_need_proof'] as String,
      categoryComplianceAck:
      json['category_compliance_ack'] as bool,
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
      'national_center_license_number':
      nationalCenterLicenseNumber,

      'waste_type': wasteType,
      'basel_agreement_approval': baselAgreementApproval,
      'material_risk_report': materialRiskReport,
      'lab_report': labReport,
      'industrial_use_commitment': industrialUseCommitment,

      'logistics_description': logisticsDescription,
      'collection_transport_method': collectionTransportMethod,
      'carrier_license_number': carrierLicenseNumber,
      'temporary_storage_facility': temporaryStorageFacility,

      'emergency_plan': emergencyPlan,
      'market_need_proof': marketNeedProof,
      'category_compliance_ack': categoryComplianceAck,
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
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