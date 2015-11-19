text(1, 天皇は、日本国の象徴であり日本国民統合の象徴であつて、この地位は、主権の存する日本国民の総意に基く。).

rule(1, 天皇, [def(象徴(日本国, 日本国民統合)), by(基づく(地位, 日本国民の総意))]).

%--------------------------------------------------------------------
text(2, 皇位は、世襲のものであつて、国会の議決した皇室典範の定めるところにより、これを継承する。).

rule(2, 皇位, [def(世襲のもの), by(継承する(皇室典範の定め))]).

%--------------------------------------------------------------------
text(3, 天皇の国事に関するすべての行為には、内閣の助言と承認を必要とし、内閣が、その責任を負ふ。).

rule(3, 国事行為, [def(天皇の国事に関するすべての行為), need(内閣の助言), need(内閣の承認), res(責任(内閣))]).

%--------------------------------------------------------------------
text(4-1, 天皇は、この憲法の定める国事に関する行為のみを行ひ、国政に関する権能を有しない。).
text(4-2, 天皇は、法律の定めるところにより、その国事に関する行為を委任することができる。).

rule(4-1, 天皇, [do(国事行為), have_not(国政に関する権能)]).
rule(4-2, 天皇, [can(委任(国事行為, 法律の定めるところにより))]).

%--------------------------------------------------------------------
text(5, 皇室典範の定めるところにより摂政を置くときは、摂政は、天皇の名でその国事に関する行為を行ふ。この場合には、前条第一項の規定を準用する。).

rule(5, 摂政, [by(定める(皇室典範)), do(国事行為(天皇の名で)), apply(4-1)]).

%--------------------------------------------------------------------
text(6-1, 天皇は、国会の指名に基いて、内閣総理大臣を任命する。).
text(6-2, 天皇は、内閣の指名に基いて、最高裁判所の長たる裁判官を任命する。).

rule(6-1, 天皇, [do(任命(内閣総理大臣, by(国会の指名)))]).
rule(6-2, 天皇, [do(任命(最高裁判所裁判長, by(内閣の指名)))]).

%--------------------------------------------------------------------
text(7, 天皇は、内閣の助言と承認により、国民のために、左の国事に関する行為を行ふ。).

rule(7, 天皇, [do(国事行為(by(内閣の助言と承認), for(国民のために)))]).
rule(7, 国事行為, [def(公布(憲法改正, 法律, 政令, 条約)),
				 def(召集(国会)),
				 def(解散(衆議院)),
				 def(公示(国会議員の総選挙)),
				 def(任免(国務大臣及び法律の定めるその他の官吏)),
				 def(認証(全権委任状及び公使の信任状)),
				 def(大赦),
				 def(特赦),
				 def(減刑),
				 def(免除(刑の執行)),
				 def(認証(復権)),
				 def(授与(栄典)),
				 def(認証(批准書及び法律の定めるその他の外交文書)),
				 def(接受(外国の大使及び公使)),
				 def(儀式)]).

%--------------------------------------------------------------------
text(8, 皇室に財産を譲り渡し、又は皇室が、財産を譲り受け、若しくは賜与することは、国会の議決に基かなければならない。).

rule(8, 皇室への財産譲渡, [by(国会の議決)]).
rule(8, 皇室への財産譲受, [by(国会の議決)]).
rule(8, 皇室への財産賜与, [by(国会の議決)]).

%--------------------------------------------------------------------
% 第２章 戦争の放棄

text(9-1, 日本国民は、正義と秩序を基調とする国際平和を誠実に希求し、国権の発動たる戦争と、武力による威嚇又は武力の行使は、国際紛争を解決する手段としては、永久にこれを放棄する。).
text(9-2, 前項の目的を達するため、陸海空軍その他の戦力は、これを保持しない。国の交戦権は、これを認めない。).

rule(9-1, 日本国民, [call(正義と秩序を基調とする国際平和), renounce(国権の発動たる戦争(as(国際紛争を解決する手段))), renounce(武力による威嚇又は武力の行使(as(国際紛争を解決する手段)))]).
rule(9-2, 日本, [have_not(陸海空軍その他の戦力), not_recognize(国の交戦権)]).

%--------------------------------------------------------------------
% 第３章 国民の権利及び義務

text(10, 日本国民たる要件は, 法律でこれを定める。).

rule(10, 日本国民の要件, [by(法律で定める)]).

%--------------------------------------------------------------------
text(11, 国民は、すべての基本的人権の享有を妨げられない。この憲法が国民に保障する基本的人権は、侵すことのできない永久の権利として、現在及び将来の国民に与へられる。).

rule(11, 国民, [not_be_prevented(基本的人権の享有)]).
rule(11, 憲法, [guarantee(基本的人権)]).
rule(11, 基本的人権, [def(侵すことのできない永久の権利), confer(現在及び将来の国民)]).

%--------------------------------------------------------------------
text(12, この憲法が国民に保障する自由及び権利は、国民の不断の努力によつて、これを保持しなければならない。又、国民は、これを濫用してはならないのであつて、常に公共の福祉のためにこれを利用する責任を負ふ。).

rule(12, 国民, [maintain(憲法が保障する自由及び権利(by(不断の努力))), ban(濫用(自由及び権利)), res(利用する(自由及び権利(for(公共の福祉))))]).

%--------------------------------------------------------------------
text(13, すべて国民は、個人として尊重される。生命、自由及び幸福追求に対する国民の権利については、公共の福祉に反しない限り、立法その他の国政の上で、最大の尊重を必要とする。).

rule(13, 国民, [be_respected(as(個人)), right(生命、自由及び幸福追求の権利)]).
rule(13, 生命、自由及び幸福追求の権利, [need(最大の尊重(立法その他の国政の上で, extent(公共の福祉に反する場合)))]).

%--------------------------------------------------------------------
text(14-1, すべて国民は、法の下に平等であつて、人種、信条、性別、社会的身分又は門地により、政治的、経済的又は社会的関係において、差別されない。).
text(14-2, 華族その他の貴族の制度は、これを認めない。).
text(14-3, 栄誉、勲章その他の栄典の授与は、いかなる特権も伴はない。栄典の授与は、現にこれを有し、又は将来これを受ける者の一代に限り、その効力を有する。).

rule(14-1, 国民, [def(法の下に平等), not(差別(政治的、経済的又は社会的関係において, 人種、信条、性別、社会的身分又は門地により))]).
rule(14-2, 憲法, [not_recognize(華族その他の貴族の制度)]).
rule(14-3, 栄典, [def(栄誉), def(勲章), def(その他), not_recognize(特権)]).
