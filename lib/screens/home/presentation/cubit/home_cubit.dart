import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
    status: RequestStatus.loading,
    data: [],
    selectedTab: 'services',
  ));

  /// 🔹 API State
  // Future<void> fetchData() async {
  //   emit(state.copyWith(status: RequestStatus.loading));
  //
  //   try {
  //     final result = await repo.getData();
  //
  //     emit(state.copyWith(
  //       status: RequestStatus.success,
  //       data: result,
  //     ));
  //   } catch (e) {
  //     emit(state.copyWith(
  //       status: RequestStatus.failure,
  //       error: e.toString(),
  //     ));
  //   }
  // }

  /// 🔹 UI State (NO API CALL)
  void changeTab(String tab) {
    List products  = [
      {
        "title":"سكراب الحديد",
        "description":"تداول وبيع وشراء سكراب الحديد بمختلف أنواعه",
      },
      {
        "title":"سكراب الألمنيوم",
        "description":"تداول الألمنيوم المعاد تدويره بأسعار تنافسية",
      },
      {
        "title":"سكراب النحاس",
        "description":"بيع وشراء النحاس المستعمل بمختلف درجات النقاوة",
      },
      {
        "title":"سكراب ستانلس ستيل",
        "description":"تداول قطع الستانلس ستيل المستعملة بجميع أنواعها وأحجامها، مناسبة لإعادة التدوير أو الاستخدام الصناعي",
      },
      {
        "title":"سكراب طبليات الأخشاب",
        "description":"طبليات خشبية مستعملة صالحة للاستعمال",
      },
      {
        "title":"سكراب الزجاج",
        "description":"تجميع وبيع الزجاج المعاد تدويره من المصانع والمواقع المختلفة، بجودة عالية ومناسب للاستخدام الصناعي",
      },

    ];
    List service  = [
      {
        "title":"إعادة تدوير المعادن",
        "description":"خدمة متكاملة لإعادة تدوير المعادن بطرق صديقة للبيئة",
      },
      {
        "title":"خدمة النقل والتوصيل",
        "description":"نقل السكراب من وإلى أي مكان بسرعة وأمان",
      },
      {
        "title":"تفكيك وتجهيز",
        "description":"تفكيك المنشآت والمعدات واستخراج السكراب بمهارة",
      },


    ];
    List rental  = [
      {
        "title":"خدمة إيجار المعدات الثقيلة",
        "description":"توفر خدمة إيجار المعدات الثقيلة مجموعة متنوعة من المعدات الصناعية والميكانيكية الضخمة المستخدمة في المشاريع الكبرى مثل البناء والتعدين وصيانة الطرق",
      },
      {
        "title":"خدمة إيجار معدات الحفر والنقل",
        "description":"تقدم هذه الخدمة مجموعة شاملة من معدات الحفر، مثل الحفارات والكشاطات، بالإضافة إلى مركبات النقل الثقيلة مثل الشاحنات والقاطرات لضمان سير عمليات النقل والحفر بسلاسة وكفاءة",
      },
      {
        "title":"خدمة إيجار المعدات الخدمية",
        "description":"تشمل هذه الخدمة معدات وأدوات الدعم اللوجستي والخدمي مثل مضخات المياه، المولدات الكهربائية، أدوات التثبيت، وجميع المعدات المساعدة التي تُستخدم في الصيانة اليومية أو المشاريع الصغيرة والمتوسطة",
      },


    ];


    emit(state.copyWith(selectedTab: tab,data: tab =='products'? products : tab =='service'? service :rental));
  }
}