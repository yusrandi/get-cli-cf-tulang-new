import 'package:get/get.dart';

class SendiController extends GetxController {
  final count = 0.obs;
  List<dynamic> listDetail = <dynamic>[].obs;
  List<dynamic> listDetailResult = <dynamic>[].obs;
  List<dynamic> listTitle = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    init();
    initTitle();
    listDetailResult = listDetail;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<List<dynamic>> runFilter(String keyword) async {
    List<dynamic> results = [];
    if (keyword.isEmpty) {
      var list = listDetail;
      results = list;
    } else {
      results = listDetail
          .where((element) => element['title_id'] == keyword)
          .toList();
    }
    return results;
    // listDetailResult = results;
  }

  init() {
    listDetail.addAll([
      {
        'title_id': '0',
        'detail': 'a. Ciri-ciri yang dialami penderita osteoporosis yaitu',
        'desc': [
          'Berat badan rendah (indeks masa tubuh <19 kg/m2)',
          'Berat badan rendah (indeks masa tubuh <19 kg/m2)',
          'Berat badan rendah (indeks masa tubuh <19 kg/m2)',
          'Berat badan rendah (indeks masa tubuh <19 kg/m2)',
        ]
      },
      {
        'title_id': '0',
        'detail': 'b. Penatalaksanaan penderita osteoporosis yaitu',
        'desc': [
          'Diet, kepadatan tulang harus mendapatkan cukup kalsium (1.000 mg/hari) dalam dietnya (minum susu atau makan makanan tinggi kalsium seperti salmon).',
          'Spesialis, orang dengan faktur tulang belakang, pinggang atau pergelangan tangan harus dirujuk ke spesialis ortopedi untuk manajemen selanjutnya.',
          'Olahraga, modifikasi gaya hidup harus menjadi salah satu pengobatan. Olahraga yang teratur akan menguarngi patah tulang akibat osteoporosis. Olahraga yang direkonmendasikan antara lain jalan kaki, bersepeda dan joging.',
          'Obat-obatan, seperti estrogen, kalsium, bifosfonat, hormon kalsitonin, dan teriparatide.',
        ]
      },
      {
        'title_id': '1',
        'detail': 'a. Gejala penyakit pegat diantaranya',
        'desc': [
          'Nyeri tulang ',
          'Gangguan syaraf seperti kesemutan atau sulit bergerak bila tulang menyebabkan penekanan syaraf.'
        ]
      },
      {
        'title_id': '1',
        'detail': 'b. Ciri-ciri penyakit pegat yaitu',
        'desc': [
          'Tulang bengkak dan memendek',
          'Daerah tulang bila teraba akan terasa lebih hangat',
          'Tulang rawan menipis dan menghilang',
        ]
      },
      {
        'title_id': '1',
        'detail': 'c. Penanganan penyakit ini yaitu',
        'desc': [
          'Latihan jasmani (olaharaga) ',
          'Obat-obatan, biphophonat, kalsitonin, plicamcsin dan gallium nitrate, pemberian kalsium (.000-1.500 mg/hari) dan vitamin D, serta kemoterapi dan radiasi.',
        ]
      },
      {
        'title_id': '2',
        'detail': 'a. Gejala yang dialami yaitu',
        'desc': [
          'Kerusakan jaringan lunak dengan disertai keluarnya pus dari kloaka.',
          'Malaise',
          'Demam ',
          'Kelemahan fisik',
          'Adanya keluhan nyeri tekan',
          'Gangguan pergerakan pada kaki ',
        ]
      },
      {
        'title_id': '2',
        'detail': 'b. Ciri-ciri yang dialami yaitu',
        'desc': [
          'Tubuh kurus akibat kurangnya nutrisi ',
          'Tungkai bawah didapatkan adanya luka kronis dengan bau yang khas.'
        ]
      },
      {
        'title_id': '2',
        'detail': 'c. Penatalaksanaan dari penyakit osteomielitis yaitu',
        'desc': [
          'Algenik untuk menghilangkan nyeri ',
          'Pemberian cairan intravena dan kalau perlu transfusi darah.',
          'Istirahat lokal dengan bidai atau traksi.',
          'Pemberian antibiotik secepatnya sambil menunggu biakan kuman.',
        ]
      },
      {
        'title_id': '3',
        'detail':
            'a. Gejala osteoatritis bersifat progresif, di mana keluhan terjadi secara perlahan-lahan dan lama kelamaan akan memburuk. Pada kondisi yang lazim di dapatkan yaitu:',
        'desc': [
          'Terasa kaku dan nyeri apabila digerakkan.',
          'Penurunan rentang gerak sendi.',
          'Kesulitan menggunakan persendian.',
          'Keluhan yang menyertai rasa sakit pada persendian.',
        ]
      },
      {
        'title_id': '3',
        'detail': 'b. Ciri-ciri osteoatritis yang dialami yaitu:',
        'desc': [
          'Keluhan adanya pembengkakan/peradangan.',
        ]
      },
      {
        'title_id': '3',
        'detail': 'c. Penanganan penyakit osteatritis yaitu:',
        'desc': [
          'Pendidikan kesehatan, yakni aktivitas yang menurunkan tekanan berulang pada sendi dan upaya penurunan berat badan.',
          'Terapi fisik.',
          'Kompres, yakni Kompres hangat atau dingin mampu mengurangi nyeri.',
          'Terapi obat simtomatis yakni obat natrium diklofenak, obat relaksi otot, analgetik seperti tramadol, NSAIDN termaksuk aspirin dan ibuprofen.',
        ]
      },
      {
        'title_id': '4',
        'detail':
            'a. Gejala AR menurut American Reumatism Association (ARA) yaitu:',
        'desc': [
          'Nyeri pada pergerakkan sendi atau nyeri tekan serung-kurangnya pada satu sendi.',
          'Kekakuan sendi jari-jari tangan pada pagi hari (morning stiffness).',
          'Nodul subkutan pada daerah tonjolan tulang didaerah ekstensor.',
          'Perubahan karakteristik histologik lapisan sinavia.',
          'Gambaran histologik yang khas pada nodul.',
          'Pengendapan cairan cousen yang jelek.',
        ]
      },
      {
        'title_id': '4',
        'detail': 'b. Ciri-ciri AR yang dialami yaitu ',
        'desc': [
          'Pembengkakan (oleh penebalan jaringan lunak atau oleh efusi cairan) pada salah satu sendi secara terus menerus sekurang-kurangnya selama 6 minggu.',
          'Pembengkakan pada sekurang-kurangnya salah satu sendi lain.',
          'Pembengkakan sendi yang bersifat simetris.',
        ]
      },
      {
        'title_id': '4',
        'detail':
            'c. Penanganan artritis rematoid membutuhkan pendekatan yang terpadu dalam terapi yaitu ',
        'desc': [
          'Terapi okupasi di mulai untuk membantu pasien untuk menggunakan sendi dan tendon efisien tanpa menekankan struktur ini, membantu mengurangi ketegangan pada sendi.',
          'Fisioterapi dan terapi fisik dimulai untuk membantu meningkatkan dan memepertahankan berbagai gerakan, meningkatkan kekuatan otot, serta mengurangi rasa sakit.',
          'Tindakan ortopedi meliputi tindakan bedah rekontruksi.',
          'Pengobatan DMARD’s dapat memperlambat atau mencegah perkembangan kerusakan dan hilangnya fungsi sendi. ',
          'Glukokortikoid adalah obat antiimflamasi manjur dan biasa digunakan pada pasien dengan AR untuk menjembatani waktu sampai DMARD’s efektIF.',
          'NSAID mengurangi pembengkakan dan rasa sakit.',
          'Algesik, seperti asetaminofen/parasetamol, tramadl, kodein, opiat dapat juga digunakan untuk mengurangi rasa sakit.',
        ]
      },
      {
        'title_id': '5',
        'detail': 'a. Gejala yang di alami penderita bursitis yaitu :',
        'desc': [
          'Nyeri tekan dan hangat.',
          'Penurunan rentang gerak sendi.',
        ]
      },
      {
        'title_id': '5',
        'detail': 'b. Ciri -ciri Bursitis yang dialami yaitu :',
        'desc': [
          'Terlihat adanya pembengkakan dan kemerahan pada bagian busra yang mengalami peradangan. Tempat yang paling sering adalah lutut dan olekranon.'
        ]
      },
      {
        'title_id': '5',
        'detail': 'c. Penatalaksanaan untuk meredakan nyeri yaitu :',
        'desc': [
          'Proteksi dengan pembebatan atau dengan brace.',
          'Istirahat untuk menghidari aktIFitas dari sendi untuk menurunkan nyeri.',
          'Kempres dengan kompres es dapat menurunkan nyeri.',
          'Obat-obatan, pemberian NSAID’s, asoteminofen, dan injeksi kortikosteroid.',
        ]
      },
      {
        'title_id': '6',
        'detail': 'a. Gejala yang di alami penyakit artritis sepsis yaitu :',
        'desc': [
          'Keterbatasan gerak sendi akibat adanya nyeri sendi',
        ]
      },
      {
        'title_id': '6',
        'detail': 'b. Ciri-ciri penyakit artritis sepsis yaitu :',
        'desc': [
          'Bengkak (90% kasus). Biasanya pada sendi lutut, panggul, bahu, pergelangan tangan, pergelangan kaki, dan siku',
          'Teraba hangat lokal, kelembutan, dan tenderness.',
        ]
      },
      {
        'title_id': '6',
        'detail': 'c. Penatalaksanaan penyakit artritis sepsis yaitu :',
        'desc': [
          'Artritis sepsis dengan durasi <3 minggu dapat disebuhkan secara medis jika tipe awal atau sekunder.',
          'Pada fase akut, pasien disarankan untuk mengistirahatkan sendi yang terkena.',
          'Melakaukan terapi. ',
          'Pemilihan antibiotik awal harus empiris, berdasarkan kondisi klinis, usia, ristensi kuman, dan pengecatan gram cairan sendi.',
        ]
      },
      {
        'title_id': '7',
        'detail': 'a. Gejala yang dialami penderita Artritis Gout yaitu :',
        'desc': [
          'Rasa nyeri pada malam hari dan pada saat bangun tidur',
          'Nyeri',
          'Terasa panas',
          'Sakit jika di gerakkan',
        ]
      },
      {
        'title_id': '7',
        'detail': 'b. Ciri-ciri penderita gout yaitu ',
        'desc': [
          'Bengkak',
          'Kemerahan',
        ]
      },
      {
        'title_id': '7',
        'detail': 'c. Penanganan penderita gout yaitu :',
        'desc': [
          'Kalori sesuai dengan kebutuhan. Jumlah asupan kalori harus benar disesuaikan dengan kebutuhan tubuh berdasarkan pada tinggi dan berat badan',
          'Penambahan purin. Apabial terjadi pembengkakan sendi, maka penderita gangguan asam urat harus melakukan diet bebas purin.',
          'Tinggi karborhidrat. Konsumsi karborhidrat kompleks ini sebaiknya tidak kurang dari 100 gram per hari.',
          'Rendah protein. Supan protein yang di ajurkan sebesar 50-70 g/hari atau 0,8-1 g/kg berat badan/hari.',
          'Renda lemak. Konsumsi lemak sebanyaik 15% dari total kalori.',
          'Tinggi cairan. Disarankan menghabiskan minum minimal sebanyak 2,5 L atau 10 gelas sehari.',
          'Tanpa alkohol.  Karena kadar asam urat mereka yang mengnsumsi alkohol lebih tinggi dibandingkan yang tidak mengonsusmi alkohol.',
          'Monim obat-obat seperti NSAID’s, colcbicine, corticosteroid, probenecid, allopurinol, dan uricosuric.',
        ]
      },
      {
        'title_id': '8',
        'detail': 'a. Gejala umum yang dialami LES yaitu :',
        'desc': [
          'Nyeri sendi dan bengkak',
          'Biasanya menyerang daerah utama seperti jari-jari, tanan, pergelangan tangan, dan lutut.',
          'Nyeri dada saat mengmabil napas dalam.',
          'Kelelahan.',
          'Demam.',
          'Malaise.',
          'Stromatitis.',
          'Pembengkakan kelenjar getah bening.',
        ]
      },
      {
        'title_id': '8',
        'detail': 'b. Ciri-ciri penyakit LES yaitu :',
        'desc': [
          'Sensitif terhadap sinar matahari.',
          'Ekimosis, tanda khas seperti kupu-kupu pada pipi dan semakin memburuk bila mendapat pajanan sinar matahari.',
        ]
      },
      {
        'title_id': '8',
        'detail': 'c. Penatalaksanaan penyakit LES yaitu :',
        'desc': [
          'Obat anti inflamasi nonsteroid (NSAID’s) digunkan untuk mengobati rematid dan radang selaput dada.',
          'Krim kortikosteroid digunakan untuk mengobati ruam kulit.',
        ]
      },
    ]);
  }

  initTitle() {
    listTitle.addAll([
      {
        'id': '0',
        'title': 'Osteoporosis',
        'subtitle':
            'Osteoporosis merupakan suatu keadaan penyakit yang ditandai dengan rendahnya massa tulang dan memburuknya mikrostruktural jaringan tulang, menyebabkan kerapuhan tulang sehingga meningkatkan resiko terjadinya faktor. Osteoporosis termasuk pada gangguan metabolik dan penyakit tulang.'
      },
      {
        'id': '1',
        'title': 'Penyakit Pegat',
        'subtitle':
            'Penyakit pegat pada tulang adalah suatu penaykit metabolisme pada tulang, dimana tulang tumbuh secara tidak normal, menjadi lebih besar dan lunak. Orang yang berusia 40 tahun lebih rentan mengalami penyakit ini. Biasanya pria lebih sering mengalami dibandingkan wanita. Sama halnya dengan osteoporosis, penyakit pegat juga termasuk pada gangguan metabolik.'
      },
      {
        'id': '2',
        'title': 'Osteomielitis ',
        'subtitle':
            'Osteomielitis merupkan proses inflamasi akut atau kronis dari tulang dan struktur sekunder tulang akibat dari infeksi organisme piogenik. Penyebab dari osteomielitis yang paling umum adalah staphylococcus aureus. Osteomielitis termasuk pada infeksi tulang dan sendi.'
      },
      {
        'id': '3',
        'title': 'Osteoatritis',
        'subtitle':
            'Kondisi osteoatritis merupakan suatu penyakit degeneratif pada persendian yang disebabkan oleh beberapa macam faktor. Penyakit ini mempunyai karakteristik berupa terjadinya kerusakan pada kartilago (tulang rawan sendi). Kartilago merupakan suatu jaringan keras bersifat licin yang melingkari sekitar bagian akhir tulang keras di dalam persendian, jaringan ini berfungsi sebagai penghalus gerakan antar-tulang dan sebagai peredam pada saat persendian melakukan aktivitas gerak. Osteoatritis termasuk gangguan degeneratif muskuloskelental.'
      },
      {
        'id': '4',
        'title': 'Artritis Rematoid ',
        'subtitle':
            'Artritis Rematoid (AR) adalah penyakit peradangan sistemis kronis yang tidak diketahui penyebabnya dengan manIFestasi pada sendi perIFer dengan polas simetris. AR menyebabkan kerusakan sendi dan dnegan demikian sering menyebabkan morbiditas dan kematian yang cukup besar.pada pasien AR terjadi penurunan harapan hidup 5-10 tahun, meskipun angka kematian mungkin lebih rendah pada mereka yang merespon terhadap terapi. AR termasuk penyakit rematik.'
      },
      {
        'id': '5',
        'title': 'Bursitis',
        'subtitle':
            'Bursa merupakan suatu skaus (kantong) yang berada diantara kulit dan tulang atau di antara tendon, ligamen, dan tulang. Bursa berada di jaringan sinovia dengan memproduksi cairan dan menurunkan friksi di antara struktur tersebut. Peradangan pada bursa terjadi ketika ruang sinovia mengalami penipisan dan peningktan produksi cairan yang memberikan manifestasi pembengkakakan lokal dan nyeri. Bursitis termasuk pada infeksi tuberkulosis pada tulang dan sendi.'
      },
      {
        'id': '6',
        'title': 'Artritis Sepsis',
        'subtitle':
            'Artritis sepsis adalah suatu invasi langsung berbagai mikroorganisme, termaksud bakteri, virus, mikrobakteri, dan jamur. Sama halnya dengan osteomielitis, artritis sepsis termasuk infeksi dan inflamasi muskuloskelental.'
      },
      {
        'id': '7',
        'title': 'Artirits Gout',
        'subtitle':
            'Artritis gout atau artritis pirai adalah suatu peradangan sendi sebagai manIFestasi dari akumulasi endapan kristal monosodium urat, yanh terkumpul di dalam sendi sebagai akibat dari tingginya kadar asam urat di dalam darah (hiperurisemia). Artritis gout merupakan gangguan metabolik muskuloskelental pada bagian artritis metabolik.'
      },
      {
        'id': '8',
        'title': 'Lupus Eritematus Sistematis',
        'subtitle':
            'Lupus Eritematosus Sistemis (LES) adalah penyakit radang atau inflamasi mulsistem yang penyebabnya diduga karena adanya perubahan sistem imun. Etiologi dari beberapa penyakit kolagen-vaskular sering tidak diketahui, tetapi sistem imun terlibat sebagai mediator terjadinya penyakit tersebut. LES merupakan infeksi dan inflamasi muskuloskelental pada bagian penyakit rematik sistematis.'
      },
    ]);
  }
}
