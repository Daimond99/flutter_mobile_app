import '../model/models.dart';

class SampleTrips {
  static List<TripData> getSampleTrips() {
    return [
      TripData(
        id: 1,
        country: 'ประเทศญี่ปุ่น',
        city: 'โตเกียว',
        duration: 'ระยะเวลา 10 วัน',
        price: '50,000 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'เอเซีย',
        detail:
            'สัมผัสความงดงามของเมืองหลวงญี่ปุ่น ที่ผสมผสานระหว่างความทันสมัยและประเพณีดั้งเดิม เยือนวัดเซนโซจิ ช้อปปิ้งที่ชิบูยะ และลิ้มรสอาหารญี่ปุ่นแท้ๆ ในทริปที่จะทำให้คุณประทับใจไม่รู้ลืม',
      ),
      TripData(
        id: 2,
        country: 'ประเทศสหรัฐอเมริกา',
        city: 'Los Angeles',
        duration: 'ระยะเวลา 10 วัน',
        price: '80,000 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'อเมริกา',
        detail:
            'เมืองแห่งความฝันของฮอลลีวูด สัมผัสบรรยากาศแห่งความบันเทิงระดับโลก เยือนสตูดิโอภาพยนตร์ชื่อดัง เดินเล่นที่ Hollywood Walk of Fame และเพลิดเพลินกับชายหาดสวยงามของแคลิฟอร์เนีย',
      ),
      TripData(
        id: 3,
        country: 'ประเทศสหรัฐอเมริกา',
        city: 'New York',
        duration: 'ระยะเวลา 10 วัน',
        price: '80,700 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'อเมริกา',
        detail:
            'เมืองที่ไม่เคยหลับใหล สัมผัสพลังแห่งมหานครที่ยิ่งใหญ่ที่สุดของอเมริกา เยือน Times Square, Central Park, และ Statue of Liberty พร้อมช้อปปิ้งในย่านแฟชั่นชื่อดัง',
      ),
      TripData(
        id: 4,
        country: 'ประเทศสหรัฐอเมริกา',
        city: 'Chicago',
        duration: 'ระยะเวลา 10 วัน',
        price: '80,900 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'อเมริกา',
        detail:
            'เมืองแห่งสถาปัตยกรรมและดนตรีแจ๊ส สัมผัสความงดงามของตึกระฟ้าริมทะเลสาบมิชิแกน ลิ้มรสพิซซ่าสไตล์ชิคาโก และเพลิดเพลินกับวัฒนธรรมที่หลากหลาย',
      ),
      TripData(
        id: 5,
        country: 'ประเทศเกาหลีใต้',
        city: 'โซล',
        duration: 'ระยะเวลา 5 วัน',
        price: '35,000 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'เอเซีย',
        detail:
            'เมืองหลวงแห่งเกาหลีใต้ที่เต็มไปด้วยเสน่ห์ของ K-Culture เยือนพระราชวังเคียงบกกุง ช้อปปิ้งที่มยองดง ลิ้มรสอาหารเกาหลีแท้ๆ และสัมผัสบรรยากาศแห่งฮันรยู',
      ),
      TripData(
        id: 6,
        country: 'ประเทศสิงคโปร์',
        city: 'สิงคโปร์',
        duration: 'ระยะเวลา 4 วัน',
        price: '25,000 บาท',
        imagePath: 'assets/images/omen.jpg',
        category: 'อาเซียน',
        detail:
            'เมืองสิงห์แห่งเอเชียตะวันออกเฉียงใต้ เยือน Gardens by the Bay ช้อปปิ้งที่ Orchard Road สัมผัสความหลากหลายทางวัฒนธรรมที่ Little India และ Chinatown',
      ),
    ];
  }

  // สำหรับกรณีที่ต้องการข้อมูลจาก database แต่ API ไม่ทำงาน
  static List<TripData> getTripsFromDatabase() {
    // ในอนาคตสามารถเพิ่มการดึงข้อมูลจาก local database ได้
    return getSampleTrips();
  }
}
