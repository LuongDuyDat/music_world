import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_world_app/app/view/app.dart';
import 'package:music_world_app/bloc_observer.dart';
import 'package:music_world_app/repositories/album_repository/models/album.dart';
import 'package:music_world_app/repositories/artist_repository/models/artist.dart';
import 'package:music_world_app/repositories/playlist_repository/models/playlist.dart';
import 'package:music_world_app/repositories/song_repository/models/song.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ArtistAdapter());
  Hive.registerAdapter(AlbumAdapter());
  Hive.registerAdapter(SongAdapter());
  Hive.registerAdapter(PlaylistAdapter());
  //await initDatabase();
  await Hive.openBox<Song>('song');
  await Hive.openBox<Artist>('artist');
  await Hive.openBox<Playlist>('playlist');
  await Hive.openBox<Album>('album');
  runApp(const App());
}

Future<void> initDatabase() async {
  await Hive.deleteBoxFromDisk('song');
  await Hive.deleteBoxFromDisk('playlist');
  await Hive.deleteBoxFromDisk('artist');
  await Hive.deleteBoxFromDisk('album');
  var albumBox = await Hive.openBox<Album>("album");
  var songBox = await Hive.openBox<Song>('song');
  var artistBox = await Hive.openBox<Artist>('artist');
  var playlistBox = await Hive.openBox<Playlist>('playlist');
  await artistBox.clear();
  await songBox.clear();
  await albumBox.clear();
  await playlistBox.clear();
  Artist buiAnhTuan = Artist(
      name: "Bùi Anh Tuấn",
      playlist: HiveList(playlistBox),
      song: HiveList(songBox),
      follower: HiveList(artistBox),
      following: HiveList(artistBox),
      introduction: "Bùi Anh Tuấn tham gia nhiều cuộc thi âm nhạc và đạt nhiều giải thưởng, trong đó nổi bật là năm 2011 "
          "với hai giải nhất Ngôi Sao Tiếng Hát Truyền Hình và CocaCola Music Award. Năm 2012, anh tham gia The Voice "
          "và gây chú ý với bài hát \"Nơi Tình Yêu Bắt Đầu\", tuy không giành được giải nhưng nhờ cuộc thi, anh được nhiều"
          " khán giả trẻ yêu thích, thuận lợi cho con đường ca hát chuyên nghiệp.",
      picture: "assets/images/artist/bui_anh_tuan.jpeg",
      album: HiveList(albumBox),
      userName: "buianhtuan",
      password: "buianhtuan",
      dob: DateTime.parse('1991-09-09'),
      phone: '0123456789',
      email: 'buianhtuan@gmail.com',
      gender: 'Male',
      favorites: HiveList(songBox),
      recentSearch: []
  );
  Artist luongDuyDat = Artist(
      name: "Lương Duy Đạt",
      playlist: HiveList(playlistBox),
      song: HiveList(songBox),
      follower: HiveList(artistBox),
      following: HiveList(artistBox),
      introduction: "Chào các bạn! Rất vui được làm quen",
      picture: "assets/images/artist/luong_duy_dat.jpeg",
      album: HiveList(albumBox),
      userName: "luongduydat",
      password: "123456",
      dob: DateTime.parse('2001-10-11'),
      phone: '0968438288',
      email: 'luongduydat123@gmail.com',
      gender: 'Male',
      favorites: HiveList(songBox),
      recentSearch: []
  );
  Artist sonTungMTP = Artist(
      name: "Sơn Tùng MTP",
      playlist: HiveList(playlistBox),
      song: HiveList(songBox),
      follower: HiveList(artistBox),
      following: HiveList(artistBox),
      introduction: "M-TP tên thật là Nguyễn Thanh Tùng. Cậu thanh niên sinh năm 1994 ở Thái Bình sớm bị hip hop hớp hồn"
          " giống như bao bạn bè đồng trang lứa. Và với niềm đam mê này, M-TP quyết tâm khăn gói tới Hà Nội học hỏi thêm"
          " về hip hop. Sau khi tốt nghiệp cấp 3, anh chàng dự định sẽ đầu quân làm học viên tại Học viện M4Me để rèn "
          "dũa khả năng ca hát, sáng tác... trước khi chính thức theo đuổi con đường âm nhạc.",
      picture: "assets/images/artist/son_tung_mtp.jpeg",
      album: HiveList(albumBox),
      userName: "sontungmtp",
      password: "sontung",
      dob: DateTime.parse('1994-07-05'),
      phone: '0123456789',
      email: 'mtp@gmail.com',
      gender: 'Male',
      favorites: HiveList(songBox),
      recentSearch: []
  );
  Artist hienHo = Artist(
    name: "Hiền Hồ",
    playlist: HiveList(playlistBox),
    song: HiveList(songBox),
    follower: HiveList(artistBox),
    following: HiveList(artistBox),
    introduction: "Năm 2015 Hiền Hồ tham gia cuộc thi “Tiếng hát truyền hình” và “Nhân tố bí ẩn” vào năm 2016. Sau "
        "đó, cô nộp hồ sơ để vào học tại Nhạc viện Thành phố Hồ Chí Minh. Năm 2017, Hiền Hồ tham gia chương trình "
        "Giọng Hát Việt và giành được danh hiệu Á quân. Không chỉ chăm chỉ ra sản phẩm mới thuộc dòng nhạc sở trường,"
        " Hiền Hồ còn thử sức ở các thể loại khác, có thể kể đến “Cần Xa” kết hợp với Phúc Bồ và SlimV mang màu sắc "
        "EDM.",
    picture: "assets/images/artist/hien_ho.jpeg",
    album: HiveList(albumBox),
    userName: "hienho",
    password: "hienho",
    dob: DateTime.parse('1997-02-26'),
    phone: '0123456789',
    email: 'buianhtuan@gmail.com',
    gender: 'Male',
    favorites: HiveList(songBox),
    recentSearch: [],
  );
  Song rntchnd = Song(
    name: "Rồi người thương cũng hoá người dưng",
    artist: HiveList(artistBox),
    path: "assets/songs/RoiNguoiThuongCungHoaNguoiDung.mp3",
    introduction: "Trống",
    picture: "assets/images/song/roinguoithuongcunghoanguoidung_cover.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Roi_Nguoi_Thuong_Cung_Hoa_Nguoi_Dung.lrc',
  );
  Song enxkr = Song(
    name: "Em ngày xưa khác rồi",
    artist: HiveList(artistBox),
    path: "assets/songs/em_ngay_xua_khac_roi.mp3",
    introduction: "Trống",
    picture: "assets/images/song/emngayxuakhacroi.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Em_Ngay_Xua_Khac_Roi.lrc',
  );
//album: Ngay troi ve phia cu
  Song hnmlb = Song(
    name: "Hà Nội mùa lá bay",
    artist: HiveList(artistBox),
    path: "assets/songs/Ha_Noi_Mua_La_Bay.mp3",
    introduction: "Trống",
    picture: "assets/images/song/ngay_troi_ve_phia_cu.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Ha_Noi_Mua_La_Bay.lrc',
  );
  Song pkm = Song(
    name: "Phố Không Mùa",
    artist: HiveList(artistBox),
    path: "assets/songs/Pho_Khong_Mua.mp3",
    introduction: "Trống",
    picture: "assets/images/song/ngay_troi_ve_phia_cu.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Pho_Khong_Mua.lrc',
  );
  Song hmm = Song(
    name: "Hẹn Một Mai",
    artist: HiveList(artistBox),
    path: "assets/songs/Hen_Mot_Mai.mp3",
    introduction: "Trống",
    picture: "assets/images/song/hen_mot_mai.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Hen_Mot_Mai.lrc',
  );
//album Chung ta
  Song ctcht = Song(
    name: "Chúng ta của hiện tại",
    artist: HiveList(artistBox),
    path: "assets/songs/Chung_Ta_Cua_Hien_Tai.mp3",
    introduction: "Trống",
    picture: "assets/images/song/chung_ta_cua_hien_tai.jpeg",
    listenNumber: 0,
    createAt: DateTime.now(),
    lyricPath: 'assets/lyrics/Chung_Ta_Cua_Hien_Tai.lrc',
  );
//album: Sky Tour
  Song cadsv = Song(
      name: "Chắc ai đó sẽ về",
      artist: HiveList(artistBox),
      path: "assets/songs/Chac_Ai_Do_Se_Ve.mp3",
      introduction: "Trống",
      picture: "assets/images/song/chac_ai_do_se_ve.jpeg",
      listenNumber: 0,
      createAt: DateTime.now(),
      lyricPath: 'assets/lyrics/Chac_Ai_Do_Se_Ve.lrc'
  );
  Song ctktvn = Song(
      name: "Chúng ta không thuộc về nhau",
      artist: HiveList(artistBox),
      path: "assets/songs/Chung_Ta_Khong_Thuoc_Ve_Nhau.mp3",
      introduction: "Trống",
      picture: "assets/images/song/chung_ta_khong_thuoc_ve_nhau.jpeg",
      listenNumber: 0,
      createAt: DateTime.now(),
      lyricPath: 'assets/lyrics/Chung_Ta_Khong_Thuoc_Ve_Nhau.lrc'
  );
  Song cnd = Song(
      name: "Chạy ngay đi",
      artist: HiveList(artistBox),
      path: "assets/songs/Chay_Ngay_Di.mp3",
      introduction: "Trống",
      picture: "assets/images/song/chay_ngay_di.jpeg",
      listenNumber: 0,
      createAt: DateTime.now(),
      lyricPath: 'assets/lyrics/Chay_Ngay_Di.lrc'
  );
  Album ntvpc =  Album(
    name: "Ngày trôi về phía cũ",
    artist: HiveList(artistBox),
    song: HiveList(songBox),
    introduction: "Album gồm 2 ca khúc mang màu sắc âm nhạc có một chút gì đó lạ mà rất quen, rất tình, rất Hà Nội. "
        "Một chàng trai giàu cảm xúc, nhiều suy tư và \"già\" hơn rất nhiều so với tuổi thật. Dường như bao nhiêu điều"
        " hay, bao nhiêu trăn trở nghĩ suy về tình yêu và cuộc sống, chàng trai ấy đều chắt lọc gửi gắm hết vào những "
        "ca khúc. Để tới khi nét giai điệu vang lên cùng với những ca từ buông trong chiều đông giá lạnh mới cảm nhận "
        "được sự tinh tế và những giá trị ý nghĩa quý giá của cuộc sống vốn không phải lúc nào cũng êm đềm, bằng phẳng"
        " này.",
    picture: "assets/images/song/ngay_troi_ve_phia_cu.jpeg",
    createAt: DateTime.now(),
  );
  Album chungTa =  Album(
    name: "Chúng ta",
    artist: HiveList(artistBox),
    song: HiveList(songBox),
    introduction: "Chúng ta là EP phòng thu đầu tay sắp tới của ca sĩ người Việt Nam Sơn Tùng M-TP, phát hành bởi M-TP "
        "Entertainment. Chúng ta sẽ được phát hành như là bản phát hành đầy đủ được thu âm kể từ album tổng hợp đầu "
        "tiên của anh, m-tp M-TP, đây cũng là album phòng thu đầu tiên trong toàn sự nghiệp của Sơn Tùng M-TP.",
    picture: "assets/images/album/chung_ta.jpeg",
    createAt: DateTime.now(),
  );
  Album skyTour = Album(
    name: "Sky tour",
    artist: HiveList(artistBox),
    song: HiveList(songBox),
    introduction: "Album nhạc phim/trực tiếp Sky Tour (Original Motion Picture Soundtrack) dưới định dạng tải kỹ thuật "
        "số và cho đặt trước vào ngày 8 tháng 6 năm 2020. Album được phát hành cùng thời điểm chiếu Sky Tour Movie.",
    createAt: DateTime.now(),
    picture: 'assets/images/album/sky_tour.jpeg',
  );
  Playlist nhacHienDai = Playlist(
    name: "Nhạc hiện đại",
    artist: HiveList(artistBox),
    song: HiveList(songBox),
    introduction: "Tập hợp những bài hát hiện đại hay",
    picture: "assets/images/Album1.png",
  );
  Playlist nhacCu = Playlist(
    name: "Nhạc cũ",
    artist: HiveList(artistBox),
    song: HiveList(songBox),
    introduction: "Tập hợp những bài hát cũ hay",
    picture: "assets/images/Album3.png",
  );
  artistBox.addAll([buiAnhTuan, hienHo, sonTungMTP, luongDuyDat]);
  songBox.addAll([hnmlb, pkm, hmm, rntchnd, enxkr, ctcht, cadsv, ctktvn, cnd]);
  albumBox.addAll([ntvpc, skyTour, chungTa]);
  playlistBox.addAll([nhacHienDai, nhacCu]);
  buiAnhTuan.song.addAll([hnmlb, pkm, hmm]);
  hienHo.song.addAll([rntchnd, enxkr]);
  sonTungMTP.song.addAll([ctcht, cadsv, ctktvn, cnd]);
  buiAnhTuan.album.addAll([ntvpc]);
  sonTungMTP.album.addAll([chungTa, skyTour]);
  luongDuyDat.playlist.addAll([nhacHienDai, nhacCu]);
  chungTa.song.addAll([ctcht]);
  skyTour.song.addAll([cadsv, cnd, ctktvn]);
  ntvpc.song.addAll([pkm, hnmlb]);
  chungTa.artist.addAll([sonTungMTP]);
  skyTour.artist.addAll([sonTungMTP]);
  ntvpc.artist.addAll([buiAnhTuan]);
  hnmlb.artist.addAll([buiAnhTuan]);
  hmm.artist.addAll([buiAnhTuan]);
  pkm.artist.addAll([buiAnhTuan]);
  rntchnd.artist.addAll([hienHo]);
  enxkr.artist.addAll([hienHo]);
  ctcht.artist.addAll([sonTungMTP]);
  cadsv.artist.addAll([sonTungMTP]);
  ctktvn.artist.addAll([sonTungMTP]);
  cnd.artist.addAll([sonTungMTP]);
  nhacCu.artist.addAll([luongDuyDat]);
  nhacHienDai.artist.addAll([luongDuyDat]);
  nhacCu.song.addAll([pkm, hnmlb, cadsv]);
  nhacHienDai.song.addAll([rntchnd, enxkr, hmm, ctktvn, ctcht, cnd]);
  luongDuyDat.following.addAll([buiAnhTuan, sonTungMTP]);
  buiAnhTuan.follower.add(luongDuyDat);
  sonTungMTP.follower.add(luongDuyDat);
  await buiAnhTuan.save();
  await hienHo.save();
  await sonTungMTP.save();
  await luongDuyDat.save();
  await chungTa.save();
  await skyTour.save();
  await ntvpc.save();
  await hnmlb.save();
  await hmm.save();
  await pkm.save();
  await rntchnd.save();
  await enxkr.save();
  await ctcht.save();
  await cadsv.save();
  await ctktvn.save();
  await cnd.save();
  await nhacCu.save();
  await nhacHienDai.save();
}