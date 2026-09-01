class DangerMainfestModel {
  final String manifestNumber;
  final String shipmentNumber;
  final String shipmentType;
  final String shipmentStatus;
  final String emergencyContact;
  final String infoBaseDate;
  final String infoBaseTime;

  // Producer
  final String producerCompany;
  final String producerMwan;
  final String producerCommercial;
  final String producer700;
  final String producerNcne;
  final String producerLocation;
  final double producerLongitude;
  final double producerLatitude;
  final String producerCoordinates;
  final String producerPerson;
  final String producerMobile;
  final String producerDate;
  final String producerTime;

  // Transporter
  final String transporterCompany;
  final String transporterMwan;
  final String transporterCommercial;
  final String transporter700;
  final String transporterNcne;
  final String transporterPlate;
  final String transporterSpecs;
  final String transporterCapacity;
  final String transporterDate;
  final String transporterTime;

  // Facility
  final String facilityUnifiedNumber;
  final String facilityCompany;
  final String facilityMwan;
  final String facilityCommercial;
  final String facility700;
  final String facilityNcne;
  final String facilityLocation;
  final String facilityCoordinates;
  final String facilityPerson;
  final String facilityMobile;
  final String facilityDate;
  final String facilityTime;

  final List<WasteItemModel> wasteItems;
  final List<ManifestItemModel> maniFest;

  const DangerMainfestModel({
    required this.manifestNumber,
    required this.shipmentNumber,
    required this.shipmentType,
    required this.shipmentStatus,
    required this.emergencyContact,
    required this.infoBaseDate,
    required this.infoBaseTime,
    required this.producerCompany,
    required this.producerMwan,
    required this.producerCommercial,
    required this.producer700,
    required this.producerNcne,
    required this.producerLocation,
    required this.producerLongitude,
    required this.producerLatitude,
    required this.producerCoordinates,
    required this.producerPerson,
    required this.producerMobile,
    required this.producerDate,
    required this.producerTime,
    required this.transporterCompany,
    required this.transporterMwan,
    required this.transporterCommercial,
    required this.transporter700,
    required this.transporterNcne,
    required this.transporterPlate,
    required this.transporterSpecs,
    required this.transporterCapacity,
    required this.transporterDate,
    required this.transporterTime,
    required this.facilityUnifiedNumber,
    required this.facilityCompany,
    required this.facilityMwan,
    required this.facilityCommercial,
    required this.facility700,
    required this.facilityNcne,
    required this.facilityLocation,
    required this.facilityCoordinates,
    required this.facilityPerson,
    required this.facilityMobile,
    required this.facilityDate,
    required this.facilityTime,
    required this.wasteItems,
    required this.maniFest,
  });

  factory DangerMainfestModel.fromJson(Map<String, dynamic> json) {
    return DangerMainfestModel(
      manifestNumber: json['manifest_number'] as String,
      shipmentNumber: json['shipment_number'] as String,
      shipmentType: json['shipment_type'] as String,
      shipmentStatus: json['shipment_status'] as String,
      emergencyContact: json['emergency_contact'] as String,
      infoBaseDate: json['info_base_date'] as String,
      infoBaseTime: json['info_base_time'] as String,

      // Producer
      producerCompany: json['producer_company'] as String,
      producerMwan: json['producer_mwan'] as String,
      producerCommercial: json['producer_commercial'] as String,
      producer700: json['producer_700'] as String,
      producerNcne: json['producer_ncne'] as String,
      producerLocation: json['producer_location'] as String,
      producerLongitude: (json['producer_longitude'] as num).toDouble(),
      producerLatitude: (json['producer_latitude'] as num).toDouble(),
      producerCoordinates: json['producer_coordinates'] as String,
      producerPerson: json['producer_person'] as String,
      producerMobile: json['producer_mobile'] as String,
      producerDate: json['producer_date'] as String,
      producerTime: json['producer_time'] as String,

      // Transporter
      transporterCompany: json['transporter_company'] as String,
      transporterMwan: json['transporter_mwan'] as String,
      transporterCommercial: json['transporter_commercial'] as String,
      transporter700: json['transporter_700'] as String,
      transporterNcne: json['transporter_ncne'] as String,
      transporterPlate: json['transporter_plate'] as String,
      transporterSpecs: json['transporter_specs'] as String,
      transporterCapacity: json['transporter_capacity'] as String,
      transporterDate: json['transporter_date'] as String,
      transporterTime: json['transporter_time'] as String,

      // Facility
      facilityUnifiedNumber: json['facility_unified_number'] as String,
      facilityCompany: json['facility_company'] as String,
      facilityMwan: json['facility_mwan'] as String,
      facilityCommercial: json['facility_commercial'] as String,
      facility700: json['facility_700'] as String,
      facilityNcne: json['facility_ncne'] as String,
      facilityLocation: json['facility_location'] as String,
      facilityCoordinates: json['facility_coordinates'] as String,
      facilityPerson: json['facility_person'] as String,
      facilityMobile: json['facility_mobile'] as String,
      facilityDate: json['facility_date'] as String,
      facilityTime: json['facility_time'] as String,

      // Lists
      wasteItems: (json['waste_items'] as List)
          .map(
            (item) => WasteItemModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),

      maniFest: (json['mani_fest'] as List)
          .map(
            (item) => ManifestItemModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manifest_number': manifestNumber,
      'shipment_number': shipmentNumber,
      'shipment_type': shipmentType,
      'shipment_status': shipmentStatus,
      'emergency_contact': emergencyContact,
      'info_base_date': infoBaseDate,
      'info_base_time': infoBaseTime,

      // Producer
      'producer_company': producerCompany,
      'producer_mwan': producerMwan,
      'producer_commercial': producerCommercial,
      'producer_700': producer700,
      'producer_ncne': producerNcne,
      'producer_location': producerLocation,
      'producer_longitude': producerLongitude,
      'producer_latitude': producerLatitude,
      'producer_coordinates': producerCoordinates,
      'producer_person': producerPerson,
      'producer_mobile': producerMobile,
      'producer_date': producerDate,
      'producer_time': producerTime,

      // Transporter
      'transporter_company': transporterCompany,
      'transporter_mwan': transporterMwan,
      'transporter_commercial': transporterCommercial,
      'transporter_700': transporter700,
      'transporter_ncne': transporterNcne,
      'transporter_plate': transporterPlate,
      'transporter_specs': transporterSpecs,
      'transporter_capacity': transporterCapacity,
      'transporter_date': transporterDate,
      'transporter_time': transporterTime,

      // Facility
      'facility_unified_number': facilityUnifiedNumber,
      'facility_company': facilityCompany,
      'facility_mwan': facilityMwan,
      'facility_commercial': facilityCommercial,
      'facility_700': facility700,
      'facility_ncne': facilityNcne,
      'facility_location': facilityLocation,
      'facility_coordinates': facilityCoordinates,
      'facility_person': facilityPerson,
      'facility_mobile': facilityMobile,
      'facility_date': facilityDate,
      'facility_time': facilityTime,

      'waste_items': wasteItems
          .map((item) => item.toJson())
          .toList(),

      'mani_fest': maniFest
          .map((item) => item.toJson())
          .toList(),
    };
  }
}

class WasteItemModel {
  final String name;
  final String hsCode;
  final double quantity;
  final String unit;
  final String hazardSpecs;
  final String treatmentProcedure;
  final String date;
  final String time;

  const WasteItemModel({
    required this.name,
    required this.hsCode,
    required this.quantity,
    required this.unit,
    required this.hazardSpecs,
    required this.treatmentProcedure,
    required this.date,
    required this.time,
  });

  factory WasteItemModel.fromJson(Map<String, dynamic> json) {
    return WasteItemModel(
      name: json['name'] as String,
      hsCode: json['hs_code'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      hazardSpecs: json['hazard_specs'] as String,
      treatmentProcedure: json['treatment_procedure'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'hs_code': hsCode,
      'quantity': quantity,
      'unit': unit,
      'hazard_specs': hazardSpecs,
      'treatment_procedure': treatmentProcedure,
      'date': date,
      'time': time,
    };
  }
}

class ManifestItemModel {
  final String name;
  final String packing;
  final double unit;
  final double weight;
  final String weightUnit;

  const ManifestItemModel({
    required this.name,
    required this.packing,
    required this.unit,
    required this.weight,
    required this.weightUnit,
  });

  factory ManifestItemModel.fromJson(Map<String, dynamic> json) {
    return ManifestItemModel(
      name: json['name'] as String,
      packing: json['packing'] as String,
      unit: (json['unit'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      weightUnit: json['weight_unit'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'packing': packing,
      'unit': unit,
      'weight': weight,
      'weight_unit': weightUnit,
    };
  }
}