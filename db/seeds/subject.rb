japanese_childs = ['現代文', '古文', '古文', '小論文']

japanese_grandchilds = [['全て','説明文','随筆','小説','詩・俳句','慣用句・熟語'],['全て','現代語訳','品詞','動詞','形容詞','格助詞・助動詞', '敬語', '単語', '読解'],['全て','訓読','書き下し','再読文字','否定','句法', '疑問形', '反語', '過去形', '敬語', '読解'],['---']]

parent = Subject.create(category: '国語')
japanese_childs.each_with_index do |child, i|
  child = parent.children.create(category: child)
  japanese_grandchilds[i].each do |grandchild|
    child.children.create(category: grandchild)
  end
end

english_childs = ['リーディング','ライティング','リスニング','スピーキング','文法','単語']

english_grandchilds = [['全て','文章問題','速読'], ['全て'], ['全て'],['全て','発音'], ['全て', '文型','品詞','動詞','進行形','未来形','疑問形','命令文','There構文','助動詞','受動態','不定詞','動名詞','現在分詞','過去分詞','仮定法','関係詞','前置詞','接続詞','冠詞','代名詞','形容詞','副詞','比較'], ['全て', '慣用句', '熟語表現']]

parent = Subject.create(category: '英語')
english_childs.each_with_index do |child, i|
  child = parent.children.create(category: child)
  english_grandchilds[i].each do |grandchild|
    child.children.create(category: grandchild)
  end
end

math_childs = ['数学A','数学B','数学I','数学II','数学C','数学III']

math_grandchilds = [['全て','図形の性質','場合の数','確率'],['全て','数列','ベクトル','確率分布','統計'],['全て','数と式','二次関数','図形と計量','データの分析'],['全て', '確率','統計','ベクトル','微分','積分','数列','指数関数','対数関数','三角関数',],['全て', 'ベクトル','二次曲線','複素数平面','統計'],['全て', '極限','微分法','積分法']]

parent = Subject.create(category: '英語')
math_childs.each_with_index do |child, i|
  child = parent.children.create(category: child)
  math_grandchilds[i].each do |grandchild|
    child.children.create(category: grandchild)
  end
end

science_childs = ['物理','化学','生物','地学']

science_grandchilds = [['全て', '速度','運動','仕事','熱エネルギー','波の性質','電気エネルギー','力のモーメント','運動量','円運動・慣性力','振動','光波','電気','原子'], ['全て', '化学結合','結晶','物質量','化学反応','酸・塩基','中和反応・塩','還元','電気','個体・気体・液体','反応熱','電気','化学平衡','非金属元素','金属元素','脂肪族化合物','芳香族化合物','合成高分子化合物','天然高分子化合物'], ['全て', '細胞','遺伝','血液','内臓','神経','ホルモン','免疫','植生','気候','生態系','代謝','バイオテクノロジー','生殖','発生','動物の行動','進化'], ['全て', '地球','地層','待機','環境','宇宙']]


parent = Subject.create(category: '英語')
science_childs.each_with_index do |child, i|
  child = parent.children.create(category: child)
  science_grandchilds[i].each do |grandchild|
    child.children.create(category: grandchild)
  end
end


scociety_childs = ['地理','日本史', '世界史', '倫理', '政経']

scociety_grandchilds = [['全て', '地理情報と地図','気候','環境問題,産業','エネルギーと食料問題','交通・通信・貿易','人口・村落・都市','民族','領土問題','(東・東南)アジア','(南・西・中央)アジア','アフリカ','ヨーロッパ','ロシア連邦','南北アメリカ','オセアニア'],
['全て', '石器時代','縄文時代','弥生時代','古墳時代','飛鳥時代','奈良時代','平安時代','鎌倉時代','室町時代','戦国時代(安土・桃山時代)','江戸時代','明治時代','大正時代','昭和','平成','令和','古代','中世','近代','現代'],['全て', '古代ヨーロッパ','古代アジア','古代アフリカ','中世ヨーロッパ','中世アジア','中世アフリカ','近世ヨーロッパ','近世アジア','近世アフリカ','近世アメリカ','現代ヨーロッパ','現代アジア','現代アフリカ','現代オセアニア','現代アメリア','古代','中世','近代','現代'],
['全て', '古代','中世','近代','現代','世界の思想','日本の思想','キリスト教','イスラム教','ヒンドゥー教','仏教','神道'],['全て', '日本経済','労働問題','社会保障','日本国憲法','国会','内閣','裁判所','地方自知','選挙','国際政治','国際経済','国家','資本主義経済と社会主義経済','財政','グローバル化']]

parent = Subject.create(category: '英語')
scociety_childs.each_with_index do |child, i|
  child = parent.children.create(category: child)
  scociety_grandchilds[i].each do |grandchild|
    child.children.create(category: grandchild)
  end
end









