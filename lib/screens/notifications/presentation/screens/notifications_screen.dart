import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_state.dart';
import '../../../../widgets/responsive_layout.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_)=> getIt<NotificationsCubit>()..getNotifications(),

        child: Scaffold(

          // appBar: AppBar(
          //   title: const Text('الإشعارات'),
          //   centerTitle: true,
          // ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(title: 'الإشعارات'),
                Expanded(
                  child: BlocBuilder<NotificationsCubit,NotificationsState>(builder: (context,state){
                    if (state is NotificationsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                  
                    if (state is NotificationsLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) {
                          return _buildNotificationCard(state.notifications[index].title,
                              state.notifications[index].description,context);
                        },
                      );
                    }
                  
                    if (state is NotificationsError) {
                      return Center(child: const Text('حدث خطأ'));
                    }
                  
                    return const SizedBox();
                  
                  }),
                )
                // _buildSectionHeader('اليوم'),
                // const SizedBox(height: 8),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
                // const SizedBox(height: 24),
                // _buildSectionHeader('الأمس'),
                // const SizedBox(height: 8),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
                // _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildNotificationCard(String title, String subtitle,BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: MediaQuery.of(context).size.width * 0.7 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF189491),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.close, size: 20, color: Colors.grey),

            const SizedBox(width: 12),
            // Container(
            //   width: 8,
            //   height: 8,
            //   decoration: const BoxDecoration(
            //     color: Color(0xFF189491),
            //     shape: BoxShape.circle,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
