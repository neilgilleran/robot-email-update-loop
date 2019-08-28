*** Settings ***
Library			SeleniumLibrary
Library			BuiltIn
Library			OperatingSystem
Library			Dialogs
Library			DateTime
Library			Collections
Library			String
Suite Teardown	Close Browser

*** Variables ***
${LOGIN URL}	https://eu-quercus.elluciancloud.com/app/rcsi/f?p=1001:301:8205114368295::NO:::
${SEARCH URL}   https://eu-quercus.elluciancloud.com/app/rcsi/f?p=1200:107:6637888602659::
${BROWSER}		Chrome
${username}     neilmcloughlin
${id}           16126769

#update the following lists with the matching ID's and email addresses

@{eyedees}      19104621	19104856	19103058	19105994	19704505	18197035	19749991	19103898	19105274	19106441	19101225	19106388	19106392	19103552	19104073	19104514	19104783	19104761	19106203	19104836	19104850	19105047	19107426	19701609	19105151	19106358	19104822	19105055	19107670	19106514	19105181	18158463	19106195	19104457	19104516	19105962	19103070	19736709	19101329	19103367	19107258	19107704	19106218	19107499	19106239	19106525	19104829	19107448	19106301	19104489	19106537	19107447	19106049	19105085	19103358	19104402	19103723	19107879	19104353	19104933	19103945	19107614	19107590	19105771	19105549	19105020	19105966	19103093	19104421	19104372	19103791	19104855	19107471	19106199	19106209	19106046	19103602	19107535	19105918	19104316	19102371	19105093	19106394	19107945	19106210	19107443	19102372	19105888	19107503	19707759	19104661	19103051	19104532	19105871	19741021	19105146	19107753	19104566	19106031	19730395	19104769	19729855	19103533	19106019	19104419	19100623	19104725	19107442	19106486	19105248	19105462	19104634	19106033	19103566	19103743	19106137	19107440	19105953	11105810	19737279	19105100	19103946
@{eeemails}     ClaireMcCabe@rcsi.ie	ClaireReilly@rcsi.ie	ClaireSugrue@rcsi.ie	ClodaghRushe@rcsi.ie	ColinBarry@rcsi.ie	ConcepcionBerlinP@rcsi.ie	ConnieTakacs@rcsi.ie	ConnorColson@rcsi.ie	ConorWalsh@rcsi.ie	CorrinnaMoore@rcsi.ie	DahyeShin@rcsi.ie	DanappaSanni@rcsi.ie	DanielWooi@rcsi.ie	DeepaThomas@rcsi.ie	DEEPIKAKARUNAKARAN@rcsi.ie	DeirdreKeane@rcsi.ie	DeniseNoonan@rcsi.ie	DesireeAbuyuan@rcsi.ie	DHARIALMOTAIRI@rcsi.ie	DisneyJacob@rcsi.ie	DivyaPuthooran@rcsi.ie	EdelDuffy@rcsi.ie	EileenMcLoughlin@rcsi.ie	EimearBourke@rcsi.ie	EimearLacey@rcsi.ie	EISASAFAR@rcsi.ie	EithneDunnill@rcsi.ie	ElaineFinn@rcsi.ie	ElaineHickey@rcsi.ie	ElaineKeegan@rcsi.ie	ElaineWhelan@rcsi.ie	ElizabethJoyce@rcsi.ie	EMADALHAMAIDAN@rcsi.ie	EmanuelaCefaratti@rcsi.ie	EmmaBlack@rcsi.ie	EmmaJaneDolan@rcsi.ie	EmmaTwomey@rcsi.ie	EoinButler@rcsi.ie	EoinKestell@rcsi.ie	Esnath.Chinembiri@rcsi.ie	EvaDaim@rcsi.ie	FAHADAALALI@rcsi.ie	FahadAldrywish@rcsi.ie	fahadalmutairi@rcsi.ie	FAISALALABDALHADY@rcsi.ie	FajerAlMuhanna@rcsi.ie	FarahAlarbeed@rcsi.ie	FarahAlkandari@rcsi.ie	FAWAZALAWADHI@rcsi.ie	FedericaRuggieri@rcsi.ie	FeliciaChong@rcsi.ie	FerasAlrushoud@rcsi.ie	fionabush@rcsi.ie	FionaGray@rcsi.ie	fionamonaghanTyer@rcsi.ie	FLORENCEOGUM@rcsi.ie	FrancisCassidy@rcsi.ie	FriejAbdullah@rcsi.ie	GarieTarrega@rcsi.ie	GeorginaOkoh@rcsi.ie	GeraldineHumphries@rcsi.ie	GhadahHakami@rcsi.ie	GhidaaMakki@rcsi.ie	GianlucaPorcaro@rcsi.ie	GillianByrne@rcsi.ie	GillianMcConnell@rcsi.ie	GiordanaMarrone@rcsi.ie	GloriaCherechedzaiS@rcsi.ie	GraceEzeokonkwo@rcsi.ie	GraceMathew@rcsi.ie	GraceOSullivan@rcsi.ie	Graham.Roberts@rcsi.ie	HadeerAlRubh@rcsi.ie	HadiAlshammari@rcsi.ie	HAMADALABDALLAH@rcsi.ie	HameedahAlmarhooon@rcsi.ie	HaniMoathen@rcsi.ie	HassanAlsharari@rcsi.ie	heathercarroll@rcsi.ie	HeidiSchnittger@rcsi.ie	HelenHuang@rcsi.ie	HilaryBaron@rcsi.ie	HowardAskew@rcsi.ie	HuiLianKoh@rcsi.ie	HussainMarafi@rcsi.ie	HussainSafar@rcsi.ie	HusseinAli@rcsi.ie	IanLucas@rcsi.ie	IbrahimAbuHaimed@rcsi.ie	ImogenSharkeyOchoa@rcsi.ie	ImranKhan@rcsi.ie	IoanaDeac@rcsi.ie	IreneLee@rcsi.ie	IsobelBrennan@rcsi.ie	IsraaAkram@rcsi.ie	JackieOMahony@rcsi.ie	JAHANALBULUSHI@rcsi.ie	JAIMOLJAMES@rcsi.ie	JainySebastian@rcsi.ie	JamesConnor@rcsi.ie	JamesDorgan@rcsi.ie	JamieOReilly@rcsi.ie	JancySrinivas@rcsi.ie	JaneLyon@rcsi.ie	JanetFitzpatrick@rcsi.ie	JANINEMULRAIN@rcsi.ie	JasonChoo@rcsi.ie	JawadAlfilly@rcsi.ie	JazmineMohdRamzisham@rcsi.ie	JenniferReid@rcsi.ie	JennyDunne@rcsi.ie	JERICHOTYRONEGARCIA@rcsi.ie	JesúsCondeAguilar@rcsi.ie	JiaSernHup@rcsi.ie	JoanneDoyle@rcsi.ie	JonathanRoddy@rcsi.ie	JoodAlmutairi@rcsi.ie	JordanaLayno@rcsi.ie	josephinechacko@rcsi.ie	JosephLawlor@rcsi.ie	JoShuaChow@rcsi.ie	JOTHISANNAGEORGE@rcsi.ie


*** Test Cases ***
Log in user test
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Input Text      id:P101_USERNAME    ${username}
    #${password} =   Get Value From User   Input password  hidden=yes    
    
    Input Text    id:P101_PASSWORD    Superdry123!
    
    Click Element       name:P101_LOGIN
    BuiltIn.Sleep 	2
    Click Element   xpath://*[@id="R27439901205983165"]/div[1]/a/img    
    
    
    : FOR    ${eyedee}  ${eeemail}    IN ZIP    ${eyedees}    ${eeemails}
    \   log to console      ${eyedee}  stream=STDOUT  
    \   Input Text   xpath://*[@id="P301_SEARCH_TEXT"]   ${eyedee}
    \   Click Element   xpath://*[@id="apex_layout_176308900283848612"]/tbody/tr[1]/td[5]/a
    \   Click Element   xpath://*[@id="report_R34198005227411257"]/tbody/tr[2]/td/table/tbody/tr[2]/td[5]/a/img
    \   Click Element   xpath://*[@id="wwvFlowForm"]/div[2]/div[2]/div[2]/div[2]/ul/li[4]/a
    \   Click Element   xpath://*[@id="apex_layout_47832382907987045"]/tbody/tr/td/a
    \   Input Text   xpath://*[@id="P308_TERM_EMAIL"]   ${eeemail}
    \   Click Element   xpath://*[@id="apex_layout_47832382907987045"]/tbody/tr/td/a[1]
    \   Click Element   xpath://*[@id="wwvFlowForm"]/div[2]/div[2]/div[2]/div[2]/map/div/a[1]
