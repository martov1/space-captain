<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="GAME" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1406777306275"><hook NAME="MapStyle" zoom="0.826">
    <properties show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node">
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right">
<stylenode LOCALIZED_TEXT="default" MAX_WIDTH="600" COLOR="#000000" STYLE="as_parent">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.note"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="8"/>
<node TEXT="next feature to develop" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="left" ID="ID_1108692886" CREATED="1406777294209" MODIFIED="1406777306273" HGAP="320" VSHIFT="-257">
<icon BUILTIN="yes"/>
<hook NAME="FreeNode"/>
</node>
<node TEXT="working on feature" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="left" ID="ID_242903309" CREATED="1406774229474" MODIFIED="1406774302271" HGAP="319" VSHIFT="-201">
<icon BUILTIN="bookmark"/>
<hook NAME="FreeNode"/>
</node>
<node TEXT="implemented and finished" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="left" ID="ID_1602888026" CREATED="1406774239778" MODIFIED="1406774295055" HGAP="317" VSHIFT="-150">
<icon BUILTIN="button_ok"/>
<hook NAME="FreeNode"/>
</node>
<node TEXT="implemented and functional" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="left" ID="ID_1609299326" CREATED="1406774249274" MODIFIED="1406774363868" HGAP="313" VSHIFT="-100">
<icon BUILTIN="idea"/>
<hook NAME="FreeNode"/>
</node>
<node TEXT="objects" POSITION="right" ID="ID_1324082527" CREATED="1406772762376" MODIFIED="1406772777410">
<edge COLOR="#ff00ff"/>
<node TEXT="mobs" ID="ID_17479408" CREATED="1406772788825" MODIFIED="1406773366133">
<node TEXT="AI" ID="ID_1308687906" CREATED="1406773393045" MODIFIED="1406773407264">
<node TEXT="navegation" ID="ID_117905220" CREATED="1406772821648" MODIFIED="1406776049906">
<icon BUILTIN="full-1"/>
<node TEXT="pathfinding" ID="ID_1925619123" CREATED="1406772838004" MODIFIED="1406772845437">
<node TEXT="inside the current deck" ID="ID_630655937" CREATED="1406773347590" MODIFIED="1408073901823">
<icon BUILTIN="button_ok"/>
<node TEXT="check if it works with obstacles" ID="ID_512328704" CREATED="1406774784076" MODIFIED="1407612013221">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="COLL MAP IS OFFSETED BY x+1 y+1" ID="ID_769996523" CREATED="1407602832676" MODIFIED="1408073901821">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node TEXT="between decks" ID="ID_20381959" CREATED="1406773333347" MODIFIED="1406773338083"/>
<node TEXT="in dinamic environment" ID="ID_1155111950" CREATED="1406773338696" MODIFIED="1408073533929">
<icon BUILTIN="help"/>
</node>
<node TEXT="between decks" ID="ID_1238748995" CREATED="1407612046705" MODIFIED="1408073524911"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      until self.deck == self.destination_deck
    </p>
    <p>
      find closest lift that goes UP
    </p>
    <p>
      use it
    </p>
    <p>
      end
    </p>
  </body>
</html>
</richcontent>
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_601023578" STARTINCLINATION="65;-8;" ENDINCLINATION="39;-6;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
</node>
<node TEXT="movement" ID="ID_904829109" CREATED="1406772847313" MODIFIED="1406772849687">
<node TEXT="between decks" ID="ID_601023578" CREATED="1406772863441" MODIFIED="1406773321234">
<icon BUILTIN="bookmark"/>
</node>
<node TEXT="in dinamic environment" ID="ID_27963294" CREATED="1406772872479" MODIFIED="1406772884418"/>
<node TEXT="&quot;stuck&quot; algorithm?" ID="ID_1417713682" CREATED="1406776218355" MODIFIED="1406776233716"/>
<node TEXT="inside the current deck" ID="ID_1042424760" CREATED="1406772855058" MODIFIED="1407612029245">
<icon BUILTIN="button_ok"/>
<node TEXT="check if it works with obstacles" ID="ID_1080244316" CREATED="1406774784076" MODIFIED="1407612034380">
<icon BUILTIN="button_ok"/>
</node>
</node>
</node>
</node>
</node>
<node TEXT="crewmen" ID="ID_30062168" CREATED="1406774919865" MODIFIED="1406776133937">
<icon BUILTIN="full-3"/>
<node TEXT="response to alarms" ID="ID_635855255" CREATED="1406774925878" MODIFIED="1406774929911"/>
<node TEXT="needs" ID="ID_533866014" CREATED="1406774931451" MODIFIED="1406774933261"/>
<node TEXT="inventory" ID="ID_1714881762" CREATED="1406774933988" MODIFIED="1406774937118"/>
<node TEXT="stats" ID="ID_1275498327" CREATED="1406775688200" MODIFIED="1406775690877"/>
<node TEXT="crew members interaction" ID="ID_496538186" CREATED="1406777033397" MODIFIED="1406777038817"/>
<node TEXT="skills" ID="ID_292074923" CREATED="1406775692563" MODIFIED="1406775694105"/>
<node TEXT="psicological disorders" ID="ID_1405596141" CREATED="1406777063495" MODIFIED="1406777069243"/>
<node TEXT="HP" ID="ID_1122622579" CREATED="1406775696759" MODIFIED="1406775698397"/>
<node TEXT="XP" ID="ID_1785088754" CREATED="1406775750644" MODIFIED="1406775752030"/>
</node>
</node>
<node TEXT="furniture" ID="ID_1136749087" CREATED="1406772802167" MODIFIED="1406776145121">
<icon BUILTIN="full-4"/>
<node TEXT="tv" ID="ID_105555426" CREATED="1406773579541" MODIFIED="1406773656693"/>
<node TEXT="protein resecuenser" ID="ID_1558221943" CREATED="1406773657936" MODIFIED="1406773663176"/>
<node TEXT="navegation console" ID="ID_1142966818" CREATED="1406773607312" MODIFIED="1406773651410"/>
</node>
<node TEXT="infrastructure" ID="ID_1654027282" CREATED="1406773600300" MODIFIED="1406776058657">
<icon BUILTIN="full-2"/>
<node TEXT="wall" ID="ID_344905645" CREATED="1406773665572" MODIFIED="1407612237916">
<icon BUILTIN="bookmark"/>
<node TEXT="change pathfinding map" ID="ID_863292424" CREATED="1406773790290" MODIFIED="1407612234054">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="collision with debries?" ID="ID_1643223281" CREATED="1406774640975" MODIFIED="1406774648139"/>
<node TEXT="art" ID="ID_1172497861" CREATED="1406774607627" MODIFIED="1406774609058"/>
</node>
<node TEXT="elevator" ID="ID_817678665" CREATED="1406774817031" MODIFIED="1408073466744">
<icon BUILTIN="yes"/>
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_601023578" STARTINCLINATION="445;0;" ENDINCLINATION="445;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
<node TEXT="airlock" ID="ID_1711382687" CREATED="1406773668494" MODIFIED="1406773670832"/>
</node>
</node>
<node TEXT="GUI" POSITION="right" ID="ID_506299595" CREATED="1406773485810" MODIFIED="1406773488117">
<edge COLOR="#007c7c"/>
<node TEXT="main menu" ID="ID_188324725" CREATED="1406773495600" MODIFIED="1406774338450">
<icon BUILTIN="idea"/>
</node>
<node TEXT="building gui" ID="ID_1034113293" CREATED="1406773502102" MODIFIED="1406774351921">
<icon BUILTIN="bookmark"/>
<node TEXT="money display" ID="ID_649012958" CREATED="1406776160387" MODIFIED="1406776163476"/>
<node TEXT="energy display" ID="ID_1329108225" CREATED="1406776167240" MODIFIED="1406776170637"/>
</node>
<node TEXT="policy gui" ID="ID_616114200" CREATED="1406773508803" MODIFIED="1406773530393"/>
<node TEXT="object examination window" ID="ID_1886565742" CREATED="1406773531041" MODIFIED="1406774349841">
<icon BUILTIN="bookmark"/>
<node TEXT="object name in frame" ID="ID_530657385" CREATED="1406774873906" MODIFIED="1406774888290">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="HP bar" ID="ID_9849660" CREATED="1406775703721" MODIFIED="1406775707771"/>
<node TEXT="stats" ID="ID_1756995430" CREATED="1406775710157" MODIFIED="1406775712935"/>
<node TEXT="skills" ID="ID_866193696" CREATED="1406775713364" MODIFIED="1406775714834"/>
</node>
</node>
<node TEXT="other" POSITION="left" ID="ID_419900099" CREATED="1406774021719" MODIFIED="1406776107609">
<edge COLOR="#00ff00"/>
<node TEXT="game save and load" ID="ID_785225446" CREATED="1406774031348" MODIFIED="1406774041618"/>
</node>
<node TEXT="map" POSITION="right" ID="ID_393791561" CREATED="1406774653072" MODIFIED="1406774656436">
<edge COLOR="#ff00ff"/>
<node TEXT="set map to final size" ID="ID_1758945427" CREATED="1406774658539" MODIFIED="1406777350718"/>
<node TEXT="basic map layout" ID="ID_895215368" CREATED="1406775853926" MODIFIED="1406775858766">
<node TEXT="map system" ID="ID_642037812" CREATED="1406775859965" MODIFIED="1406775867345">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="multiple decks" ID="ID_1536900279" CREATED="1406775927947" MODIFIED="1406775932418">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="basic pathfinding map" ID="ID_821748762" CREATED="1406775872964" MODIFIED="1406776808751">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node TEXT="background generator" ID="ID_1074172740" CREATED="1406774705133" MODIFIED="1406774711278"/>
</node>
<node TEXT="gameplay" POSITION="left" ID="ID_638592250" CREATED="1406775723428" MODIFIED="1406776098185">
<icon BUILTIN="full-4"/>
<edge COLOR="#00007c"/>
<node TEXT="command structure" ID="ID_1118592210" CREATED="1406775735235" MODIFIED="1406775740720">
<node TEXT="ranks" ID="ID_1467547892" CREATED="1406775838236" MODIFIED="1406775839528"/>
</node>
<node TEXT="resources" ID="ID_297681725" CREATED="1406775802107" MODIFIED="1406775805591">
<node TEXT="money" ID="ID_1928273213" CREATED="1406775757925" MODIFIED="1406775761289">
<node TEXT="SCDC - space credit debit card" ID="ID_1027002149" CREATED="1406775762192" MODIFIED="1406775779480"/>
<node TEXT="loan" ID="ID_158547316" CREATED="1406775819196" MODIFIED="1406775821728"/>
</node>
<node TEXT="electricity" ID="ID_25369979" CREATED="1406775785094" MODIFIED="1406775791163"/>
<node TEXT="materials" ID="ID_578322253" CREATED="1406775792021" MODIFIED="1406775794937"/>
<node TEXT="chemicals" ID="ID_1855783357" CREATED="1406775796060" MODIFIED="1406775797960"/>
</node>
<node TEXT="schedules" ID="ID_403641868" CREATED="1406776823927" MODIFIED="1406776825774"/>
<node TEXT="room logic" ID="ID_183649914" CREATED="1406776828948" MODIFIED="1406776833933"/>
</node>
</node>
</map>
