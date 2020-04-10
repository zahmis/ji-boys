User.create!(name: "sizma",
             email: "meda829ratteru86@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             image: open("#{Rails.root}/db/fixtures/settyuu.jpeg"),
             age: "30",
             area: "北部方面",
             branch: "普通科",
             admin: "true",
             activated: true,
             activated_at: Time.zone.now)

User.create!(id: 2,
             name:  "田中　翔荘",
             email: "shouzoutanaka2020@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             image: open("#{Rails.root}/db/fixtures/nyosintensei.jpeg"),
             age: "25",
             area: "中部方面",
             branch: "特科",
             activated: true,
             activated_at: Time.zone.now)

User.create!(id: 3,
             name:  "sakatatu",
             email: "sakatatu@waimail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             image: open("#{Rails.root}/db/fixtures/datyou.jpeg"),
             age: "24",
             area: "北部方面",
             branch: "普通科")

User.create!(id: 4,
             name:  "taikiyama",
             email: "taikiyama@waimail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             image: open("#{Rails.root}/db/fixtures/haniwa.jpeg"),
             age: "19",
             area: "西部方面",
             branch: "通信科")

7.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@foobar.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


#users = User.order(:created_at).take(6)
#  title = Faker::Lorem.sentence(5)
#  content = Faker::Lorem.sentence(5)
#  users.each {|user| user.posts.create!(title: title, content: content)}
#end

user = User.find(1)
  user.posts.create!(
  title: "自衛隊前にしておくべきこと",
  content: "基本的には何もしなくて問題ない。

なぜならばなんとかなるからである。

しかし、不安もあるだろう。そんなときは皆一緒と言うことを思い浮かべて欲しい。

自分と他人はそんなに大差はないと言うことがわかれそんなに気に止むことはないだろう。

それでも不安な人は、おそらく体力面が引っかかっているのだろう。入隊してからでも問題はないのだが、

一応の基準としては３０００m走を１５分以内で腕立て伏せを２０回、腹筋４０回できれば良いだろう。

教育隊によって何を重視するかは異なるが、基本は走ることと腕立て伏せなので、これだけ鍛えれば入った後安心できる。")

user = User.find(1)
  user.posts.create!(
    title: "演習とは？",
    content: "いわゆる模擬戦争です。

職種によってやることが異なるので、ここでは普通科の話をします。

まず、攻撃と防御に別れます。

攻撃の基本的な流れは、行軍→敵前衛の解明→偵察→総攻撃
となります。

攻撃は結構スピード感があって、すぐ終わる印象です。（４〜６日くらい？）

防御は『待つ』です。

基本的に防御陣地を構築して、そんなかに入って待つ（防御する）です。

防御は結構長いです。攻撃の1.5~2倍の期間かかった印象です。

これがとんでもなく性に合わない人もいます。我慢大会みたいなもんです。

寒冷地での冬季検閲の防御なんかは相当きついです。

本当に凍傷一歩手前とかあります。

")


user = User.find(1)
  user.questions.create!(
  title: "どの訓練が一番きついだろうか",
  content: "冬季検閲訓練の防御に一票")


user = User.find(2)
  user.posts.create!(
    title: "教育隊について",
    content: "教育隊は教育大隊で行われる教育と一般部隊が受け持つ教育隊に大別される。

一概には言えないが、教育大隊は結構しっかりしている（きついがやっていける）印象。

一般部隊は結構脇が甘かったり、そこまできつくない（優しい）もしくは、相当理不尽な教育をする。

完全な余談であるが、普通科などの肉体系の部隊であればそんなに無茶なことはしない。

と言うのも肉体系の部隊は、人間の限界や指導法に関して知見があるため教育でどこまで求めるかが明確だからだ。

それに対して、いわゆる後方支援系（通信など）が担当するとあまりいい噂は聞かない。
もちろんちゃんとした教育をするとは思うが。。。



教育隊の内容

教育隊の内容は初期・中期・後期に分かれると言っても良い。

初期はまず縫い物、注記、基本教練、体育、座学などなど。（もちろん靴磨きやアイロンもあるよ。）

縫い物は班長次第だが、だいたいなんとかなるし、班に一人うまいやつがいるので結局そいつが他の遅れているやつの手伝いをする。（もしくは班長が補助してくれる。これは出血大サービスだが。。。）

注記はただ単に名前を書くだけ。
体育は基本駆け足（ランニング）。これもレベル別にやるので焦る必要はない。

中期（ゴールデンウィーク明け）は基本教練の応用、戦闘訓練、体育が主な内容である。（初期の内容もしっかりやるよ！）

そしてここからが教育隊の本領である『指導』が入ってくる。

これは教育隊で避けては通れないのでこれから入隊する人は頑張ってください。。。

この期間は何をしても否定され、理不尽を味わる期間です。例えば、絶っっっっったいに不可能な時間に武器格納を命令されたりします。

そんな時に限って昼食はラーメン＋餃子定食みたいな日です。

昼食時間は２分で食うと言うより流し込むに近い状態。

ほとんど残してご馳走様をし、急いで武器庫に行くも当然間に合わないのでしっかり指導をくらいます。

そんな日が一月ほど続きます。

でも不思議と新隊員は辞めません。

むしろ隣の緩い区隊ほど辞めていきました。これはたまたまかもしれませんが。

後期もやることは基本的に変わりませんが、だんだん余裕が生まれてくる頃です。

この時に非常呼集があります。

でも我々もバカじゃないので、班長の雰囲気とかで察知します。

非常呼集からの流れは正直あんまり覚えていないのでそんなに大変ではないのでしょう。

そして２５km行軍、防御陣構築、他　があります。

10km行軍はかなりキツかった印象ですが、１０kmがクリアできたら２５kmは簡単にクリアできます。

そんなことよりも防御陣構築がキツすぎて人間ってこんなに汗かくのかと思ったほどです。

器用な奴はサクサク掘っていって３時間くらいで穴は掘り終えます。

私は４〜５時間かかったような気がします。。

これが終わる頃には班長も指導モードが終わりを迎えます。

この指導モードを早く終わらせることをお勧めします。

私の区隊は指導モードがめちゃくちゃ長かったらしいです。（後日、班長陣から言われる。）

集大成として、戦闘訓練が終われば、残りは小銃等の整備があります。これは舐めてはいけません。
汚れひとつ残してはいけません。少しでも班長が汚れと認識したら、即返却をくらいます。
これが終われば、教育はほぼ終了です。")

user = User.find(2)
  user.posts.create!(
    title: "自衛隊の休みについて",
    content: "休みはいっぱいあります。

しかし、果たして休みと言えるのかは不明です。

というのも隊舎住まいならば必ず『残留』というシステムがあるからです。

休みでも営内にいなければならないのです。

インドアが好きな人は苦になりませんが、休みの日に遊びに行きたい人や、

飲みに行きたい人は地獄のようなシステムです。

また警衛は休みの日もあるので、その時に当たると、振り休で他の日に休めたりします。")

user = User.find(3)
  user.posts.create!(
    title: "指導１　エンドレス腕立て姿勢",
    content:"その名の通りである。

密室で行われるこの指導は汗が尋常じゃなく出るので汗だまりができる奴もいる。

私はそんなことよりも手首がぶっ壊れそうだったのを今でも覚えている。

時間にするとおそらく２０〜３０分くらいだと思うのだが、これが無限に感じた。

もちろん途中で膝をつく奴もいるがすかさず班長がきて色々くらう。")

user = User.find(3)
  user.posts.create!(
    title: "指導 2  戦闘訓練　無限匍匐前進",
    content: "山に連れて行かれる。

砂利のあるところでヨーイドン。

第一匍匐から順番に第五匍匐までさせられる。

私はこれがたまらなく嫌だった。というのも全身内出血だらけになるからだ。

もう、痛くて痛くしょうがないのだ。第４匍匐は匍匐前進の中では比較的楽なのであるが、砂利道では別だ。

肘が砂利にぶつかって内出血ができる。でもやるしかないのでそのままやる。

当然匍匐前進は第４に関わらず遅くなる。班長に怒鳴られる。この繰り返し。

本当に早く終われとしか思っていなかった。

一つ羨ましかったのは、格闘技をずっとやっていた同期がいるのだ、そいつは内出血が全くできていなかった。
（匍匐も恐ろしく早い）

後でMR（医療営業）をやっている友達に聞いたら、どうやら中性脂肪が関係しているらしい。
私は中性脂肪の値が低すぎるので内出血しやすいらしい。この数値が適正もしくは高ければ、そんなに苦労しないかもしれない。")

user = User.find(3)
  user.posts.create!(
    title: "指導 ３  戦闘訓練　地獄のハイポート",
    content:"人生でこんなに汗をかいたのはこのハイポートと防御陣構築の時の穴掘りだ。

穴掘りはまだ自分で制御可能なので良いが、ハイポーとは違う。

一応ハイポートを知らない人のために言っておくと、小銃を胸の前にしっかり保持してひたす大声を出して走ることである。

短時間のハイポートはそこまで苦じゃないが、本当にハイポートだけをするのは苦でしかない。

トータルで３時間走りっぱなしの訓練だったと思うが、実際に走った距離はそんな大した距離ではなかったらしい。

この時初めて自分の限界を感じ、隊列（先頭集団）についていけなかったのを覚えている。

班長の怒号は鳴りっぱなしだし、先の匍匐前進で全身内出血だらけだし、いつまで続くかわからないことが精神を徐々に追い詰めてきたのを鮮明に覚えている。

走り終わった時に飲んだ水（水道水）は死ぬほど旨かったのも鮮明に覚えている。

普通の教育隊の区隊はこんだけやったら今日の指導なりは終わるはずなのだが、私の教育隊は山でのハイポートの後、駐屯地に帰隊して、さらに駆け足１時間をさせられた。

この日ほど教育期間で肉体的に厳しかった日はない。

他の区隊は武器整備をして明日に備えている最中、俺たちはなんで走ってんだろう、なんて残念な区隊なんだ、どうせ課業外（自由時間）に武器の整備をさせられるんだろう？アイロンは？靴磨きは？全部ドロドロなんだけど。。。と言う思いでほとんど焼けくそで走っていた。

しかし、走り終え、当時の区隊付に言われた言葉は胸に刺さって今でも自分の礎になっている。

『今日ほど苦しい日はそうそうこない。でもお前たちはやったんだよ。やりきったんだよ。それがお前たちの自信になってこれからも積み上がっていくんだ。忘れんなよ』

陸上自衛隊にはRanger（レンジャー）訓練というものがある。陸上自衛隊の中で最難関の訓練だ。

後でわかった話だが、私の区隊の班長陣はほとんどがRangerに挑戦し、残念ながら怪我でRangerを習得ができなかった人達が多かったらしい。

そんな人達だからこそ、この言葉が重く心に響いたのかもしれない。

走っている時は、理不尽にしか思わなかったことも、見方を変えればこんなにも力が湧いてくるんだと自分の中で何かが変わった瞬間でもある。")


user = User.find(4)
  user.posts.create!(
    title: "班長について",
    content: "班長はとにかく人による。しかし怖いことには変わりない。

たまに仏みたいな人に当たるが、まあないと思って差し支えない。

班長はとにかく班員のアラを探して指導しようとしてくる。（それが仕事なので）

新隊員はそのアラをちょっとづつ修正していくことで自衛官に近づく。

このアラが残りっぱなしで部隊に行ってしまうと結構苦労するので、

班長も班員を苦労させまいと必死で指導してくる。

そうやって信頼関係が構築されてくるとだんだん指導は減り、

教育が終わる頃には、普通の対人関係に近づきます。（最後まで怖い班長もいるよ。。。）

班長も人なので、教育期間中は相当無理をしています。

根っからのサディストではない限り、苦悩しながら班員を指導しています。

嫌われ役って結構ストレスがかかりますからね。
")

user = User.find(4)
  user.posts.create!(
    title: "班付きについて",
    content: "班付きとは、班長の仕事をサポートしたり、班員のお手本となって行動したりする人です。

各部隊から派遣されてきます。基本的に優秀な人がきます。

でも私が班付きでいった時は？？？ってなる人も来ていたので関係ないのかもしれません。

班長が優しかったりすると、班付きは苦労します。班付きが指導しなければならないからです。

普通は班長が厳しくて、班付きが優しいみたいな関係です。

新隊員は、自衛隊のことが右も左もわかりません。なので当然やっちゃいけないことをいっぱいします。

そんな時、鬼のように指導をされるのですが、その時に何がダメだったかを自分たちで考えます。

でもわかんないときもあります。

そんなとき、班付きの登場です。

班付きが解説してくれたり、励ましてくれたりするので、班員たちは次のステップに行きやすくなります。

（注　何もしてくれない班付きもいます。）")

user = User.find(4)
  user.posts.create!(
    title: "演習場整備について",
    content: "部隊に配属されて、間違いなく最初の試練と言えます。

ここでの働きで新隊員の評価が決まります。

しかし心配はいりません。新隊員は基本的に使えない存在なのは部隊の人たちは了解済みです

では何をするのか？というと、一期上の先輩のいうことをしっかり聞いて、それを忠実にこなすことです。

一期上が頼りないならば二期上の人にも聞きましょう。

やることはとても多いですが、求められることはそう多くはありません。

当たり前のことを当たり前にするだけで、あなたの評価は上がります。

ここでしっかり上司とコミュニケーションをとり、

余計なことは言わず、

信頼関係を深めていけばいいだけです。

新隊員上がりならば、多少の無茶はできる心意気なはずです。

それだけで充分なのです。

難しいことは、年数が立っていけば自然とできるようになります。")

user = User.find(4)
  user.posts.create!(
    title: "演習場整備具体的に何をするのか",
    content: "演習場整備は演習場を整備することです。

本当にこれだけです。

でもそんなこと言ったら記事にならないので、具体的に書きます。

日課時限は

木材伐採

側溝掃除

道路整備

草刈り

野焼き　etc

を主に行います。

え？そんだけ？　って思った方。

演習場は莫大なんです。

これらの作業を１〜２週間かけて泊まりで行います。

日課時限が終わると新隊員及び若手陸曹や若手陸士は大忙しです。

素早く風呂をすませ、煮炊きの準備をします。

ここは一日一日、メニューを変えなければ上司から苦情がきます。

その辺は若手陸曹が仕切ってくれるので、新隊員はそれに従って動けばOKです。

一緒に飯を食って酒を飲めば、上司との中もだんだん良くなります。

演習場整備が終わる頃には、しっかりと信頼関係が構築できるはずです。
")
