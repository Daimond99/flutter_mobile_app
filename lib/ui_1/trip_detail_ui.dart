import 'package:flutter/material.dart';
import '../model/models.dart';

class TripDetailUI extends StatelessWidget {
  final TripData trip;
  final VoidCallback onBookTrip;

  const TripDetailUI({super.key, required this.trip, required this.onBookTrip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF667eea),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                onPressed: () {
                  // TODO: Add to favorites
                },
              ),
              const SizedBox(width: 16),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  _buildTripImage(trip.imagePath),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF667eea),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            trip.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          trip.city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          trip.country,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and Duration Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.access_time,
                                  color: Color(0xFF667eea),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                trip.duration,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: Colors.grey[300],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                trip.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description Section
                  const Text(
                    'รายละเอียดทริป',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      trip.detail.isNotEmpty
                          ? trip.detail
                          : _getTripDescription(trip.city),
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Highlights Section
                  const Text(
                    'highlight ของทริป',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: _getTripHighlights(trip.city).map((highlight) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF667eea),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  highlight,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Book Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF667eea).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: onBookTrip,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'จองทริปนี้',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTripDescription(String city) {
    switch (city) {
      case 'โตเกียว':
        return 'สัมผัสความงดงามของเมืองหลวงญี่ปุ่น ที่ผสมผสานระหว่างความทันสมัยและประเพณีดั้งเดิม เยือนวัดเซนโซจิ ช้อปปิ้งที่ชิบูยะ และลิ้มรสอาหารญี่ปุ่นแท้ๆ ในทริปที่จะทำให้คุณประทับใจไม่รู้ลืม';
      case 'Los Angeles':
        return 'เมืองแห่งความฝันของฮอลลีวูด สัมผัสบรรยากาศแห่งความบันเทิงระดับโลก เยือนสตูดิโอภาพยนตร์ชื่อดัง เดินเล่นที่ Hollywood Walk of Fame และเพลิดเพลินกับชายหาดสวยงามของแคลิฟอร์เนีย';
      case 'New York':
        return 'เมืองที่ไม่เคยหลับใหล สัมผัสพลังแห่งมหานครที่ยิ่งใหญ่ที่สุดของอเมริกา เยือน Times Square, Central Park, และ Statue of Liberty พร้อมช้อปปิ้งในย่านแฟชั่นชื่อดัง';
      case 'Chicago':
        return 'เมืองแห่งสถาปัตยกรรมและดนตรีแจ๊ส สัมผัสความงดงามของตึกระฟ้าริมทะเลสาบมิชิแกน ลิ้มรสพิซซ่าสไตล์ชิคาโก และเพลิดเพลินกับวัฒนธรรมที่หลากหลาย';
      default:
        return 'ทริปสุดพิเศษที่จะมอบประสบการณ์ที่ไม่เหมือนใครให้กับคุณ';
    }
  }

  List<String> _getTripHighlights(String city) {
    switch (city) {
      case 'โตเกียว':
        return [
          'เยือนวัดเซนโซจิ วัดเก่าแก่ที่สุดในโตเกียว',
          'ช้อปปิ้งและสัมผัสบรรยากาศที่ชิบูยะ',
          'ลิ้มรสซูชิแท้ๆ ที่ตลาดปลาสึกิจิ',
          'ชมวิวเมืองจากโตเกียวสกายทรี',
          'สัมผัสวัฒนธรรมญี่ปุ่นที่อาซากุสะ',
        ];
      case 'Los Angeles':
        return [
          'เยือนสตูดิโอ Universal Studios Hollywood',
          'เดินเล่นที่ Hollywood Walk of Fame',
          'ชมพระอาทิตย์ตกที่ Santa Monica Pier',
          'ช้อปปิ้งที่ Rodeo Drive ย่านแฟชั่นหรู',
          'เยือน Getty Center พิพิธภัณฑ์ศิลปะชื่อดัง',
        ];
      case 'New York':
        return [
          'ขึ้นไปชมวิวที่ Empire State Building',
          'เดินเล่นใน Central Park',
          'เยือน Statue of Liberty สัญลักษณ์แห่งเสรีภาพ',
          'ช้อปปิ้งที่ Fifth Avenue',
          'ชมละครบรอดเวย์ระดับโลก',
        ];
      case 'Chicago':
        return [
          'ชมวิวเมืองจาก Willis Tower Skydeck',
          'เดินเล่นริม Millennium Park',
          'ลิ้มรสพิซซ่าสไตล์ชิคาโกแท้ๆ',
          'ล่องเรือชมสถาปัตยกรรมริมแม่น้ำ',
          'เยือน Art Institute of Chicago',
        ];
      default:
        return [
          'ประสบการณ์ที่ไม่เหมือนใคร',
          'สถานที่ท่องเที่ยวสุดพิเศษ',
          'อาหารท้องถิ่นแสนอร่อย',
          'วัฒนธรรมที่น่าสนใจ',
        ];
    }
  }

  Widget _buildTripImage(String imagePath) {
    // ตรวจสอบว่าเป็น URL หรือ asset path
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
                color: const Color(0xFF667eea),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'ไม่สามารถโหลดภาพได้',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // ใช้ asset image
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'ไม่พบภาพ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
