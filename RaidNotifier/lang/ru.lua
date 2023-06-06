local L = {}

L.Description                           			= "Выводит на экран предупреждения о разаличных событиях в Испытаниях. Только на ветеранской сложности!"

--------------------------------
----     General Stuff      ----
--------------------------------
L.Settings_General_Header                       	= "Общие"
-- Settings 
L.Settings_General_Bufffood_Reminder            	= "Напоминание о еде"
L.Settings_General_Bufffood_Reminder_TT         	= "Напоминает вам, когда вы начинаете испытание без баффа еды \nИЛИ\n ваш бафф еды истекает во время прохождения Испытания (см. интервал)"
L.Settings_General_Bufffood_Reminder_Interval		= "Интервал напоминания о еде"
L.Settings_General_Bufffood_Reminder_Interval_TT	= "Здесь вы можете задать интервал частоты, с которой RaidNotifier будет сообщать вам о вашем баффе еды.\n\nКаждые X секунд. \n\nНачиная с момента, когда до истечения текущего баффа еды остаётся 10 минут или менее."
L.Settings_General_Vanity_Pets						= "Отключить пэтов во время Испытания"
L.Settings_General_Vanity_Pets_TT					= "Отключает ваших пэтов при начале Испытания. Как только вы закончите или выйдете из Испытания, пэты включатся снова."
L.Settings_General_No_Assistants					= "Отключить помощников при начале битвы"
L.Settings_General_No_Assistants_TT					= "Работает только в Испытаниях и НЕ запрещает их призыв."
L.Settings_General_Center_Screen_Announce    		= "Предупреждения по центру экрана"
L.Settings_General_Center_Screen_Announce_TT		= "Использует игровую систему предупреждений на экране. Альтернативынй и более простой способ отображения предупреждений Raid Notifier."
L.Settings_General_UseDisplayName                   = "Использовать UserID"
L.Settings_General_UseDisplayName_TT                = "Использовать UserID в оповещениях вместо имени персонажа."
L.Settings_General_Unlock_Status_Icon               = "Разблокировать статус-значок"
L.Settings_General_Unlock_Status_Icon_TT            = "Когда включено, показывает на экране статус-значок, который может быть перемещён."
L.Settings_General_Default_Sound                	= "Звук по умолчанию"
L.Settings_General_Default_Sound_TT             	= "Звук по умолчанию для этого предупреждения."
-- Choices
L.Settings_General_Choices_Off       				= "Выкл."
L.Settings_General_Choices_Full      				= "Полный"
L.Settings_General_Choices_Normal    				= "Нормальный"
L.Settings_General_Choices_Minimal   				= "Минимальный"
L.Settings_General_Choices_Self      				= "На себе"
L.Settings_General_Choices_Near      				= "По близости"
L.Settings_General_Choices_All       				= "Все"
L.Settings_General_Choices_Always    				= "Всегда"
L.Settings_General_Choices_Other     				= "Другое"
L.Settings_General_Choices_Inverted             	= "Инвертированно"
L.Settings_General_Choices_Small_Announcement       = "Маленький (obsolete)"
L.Settings_General_Choices_Large_Announcement       = "Большой (obsolete)"
L.Settings_General_Choices_Major_Announcement       = "Огромный (obsolete)"
L.Settings_General_Choices_Custom_Announcement      = "Настраиваемый"
-- Alerts
L.Alerts_General_No_Bufffood        				= "У вас нет БАФФА ЕДЫ!"
L.Alerts_General_Bufffood_Minutes   				= "Ваш бафф еды '<<1>>' истекает через |cbd0000<<2>>|r мин.!"
-- Bindings
L.Binding_ToggleUltimateExchange                    = "Вкл. обмен данными абсолютной способности"


--------------------------------
----    Ultimate Exchange   ----
--------------------------------
L.Settings_Ultimate_Header                           = "Абсолютная способность (бета)"
L.Settings_Ultimate_Description                      = "Эта функция позволяет вам рассылать данные о вашей абсолютной способности вашим товарища, так они смогут увидеть, как скоро вы сможете применить её. Используется стоимость с учётом всех ваших снижений стоимости, откуда бы они ни шли, от комплектов или пассивных способностей."
-- Settings 
L.Settings_Ultimate_Enabled                          = "Включено"
L.Settings_Ultimate_Enabled_TT                       = "Включение раздаёт и принимает значение заряда абсолютной способности. Всегда отключено за пределами испытаний."
L.Settings_Ultimate_Hidden                           = "Скрыто"
L.Settings_Ultimate_Hidden_TT                        = "Скрывает окно абсолютной способности, но не отключает сам функционал."
L.Settings_Ultimate_UseColor                         = "Использовать цвета"
L.Settings_Ultimate_UseColor_TT                      = "Придаёт абсолютной способности один из цветов в зависимости от порога на 80 и 100 процентах заряда."
L.Settings_Ultimate_UseDisplayName                   = "Показывать имя игрока"
L.Settings_Ultimate_UseDisplayName_TT                = "Показывает имя игрока в окне абсолютной способности вместо имени персонажа."
L.Settings_Ultimate_ShowHealers                      = "Целители"
L.Settings_Ultimate_ShowHealers_TT                   = "Показывает абсолютную способность членов группы с ролью Целителя."
L.Settings_Ultimate_ShowTanks                        = "Танки"
L.Settings_Ultimate_ShowTanks_TT                     = "Показывает абсолютную способность членов группы с ролью Танка."
L.Settings_Ultimate_ShowDps                          = "DD"
L.Settings_Ultimate_ShowDps_TT                       = "Показывает абсолютную способность членов группы с ролью DD."
L.Settings_Ultimate_TargetUlti                       = "Абсолютная способность"
L.Settings_Ultimate_TargetUlti_TT                    = "Какую абсолютную способность использовать для показа процена заряда другим игрокам."
L.Settings_Ultimate_OverrideCost                     = "Переписать стоимость"
L.Settings_Ultimate_OverrideCost_TT                  = "Использовать это значение при отправке значения стоимости другим игрокам. Значение 0 отключает перезапись."


--------------------------------
----        Profiles        ----
--------------------------------
L.Settings_Profile_Header                            = "Профили"
L.Settings_Profile_Description                       = "Настройками профилей можно управлять отсюда, включая настройку на весь аккаунт, которая применит одинаковые настройки ко ВСЕМ персонажам на этом аккаунте. Из-за постоянно характера данной настройки, управление должно быть сначала включено галочкой ниже этой панели."
L.Settings_Profile_UseGlobal                         = "Использовать профиль на аккаунт"
L.Settings_Profile_UseGlobal_Warning                 = "Переключение между локальным и глобальным профилями вызовет перезагрузку интерфейса."
L.Settings_Profile_Copy                              = "Выберите профиль для копирования"
L.Settings_Profile_Copy_TT                           = "Выберите профиль для копирования его настроек в активный профиль. Активный профиль - профиль персонажа, которым вы вошли или глобальный профиль на весь аккаунт, если включено. Существующий настройки профиля буду навсегда перезаписано.\n\nЭто действие невозможно отменить!"
L.Settings_Profile_CopyButton                        = "Копировать профиль"
L.Settings_Profile_CopyButton_Warning                = "Копирование профиля перезагрузит интерфейс."
L.Settings_Profile_CopyCannotCopy                    = "Невозможно скопировать данный профиль. Пожалуйста, попробуйте снова или выберите другой профиль."
L.Settings_Profile_Delete                            = "Выберите профиль для удаления"
L.Settings_Profile_Delete_TT                         = "Выберите профиль для удаления его настроек из базы данных. Если вы зайдёте этим персонажем позже и вы не используете профиль на аккаунт, будет создан новый профиль с настройками по умолчанию.\n\nУдаление профиля невозможно отменить!"
L.Settings_Profile_DeleteButton                      = "Удалить профиль"
L.Settings_Profile_Guard                             = "Включить управление профилями"


--------------------------------
----       Countdowns       ----
--------------------------------
L.Settings_Countdown_Header                          = "Отсчёты"
L.Settings_Countdown_Description                     = "Изменяет вид и поведение наших счётчиков."
L.Settings_Countdown_TimerScale                      = "Размер таймера"
L.Settings_Countdown_TimerScale_TT                   = "Размер отображаемого таймера"
L.Settings_Countdown_TextScale                       = "Размер текста"
L.Settings_Countdown_TextScale_TT                    = "Размер отображаемого текста"
L.Settings_Countdown_UseColors                       = "Цвета"
L.Settings_Countdown_UseColors_TT                    = "Когда включено, будут использоваться желтый/оранжевый/красный цвета в счётчике по мере его приближения к нулю."


--------------------------------
----          Trials        ----
--------------------------------
L.Settings_Trials_Header                            = "Испытания (Trials)"
L.Settings_Trials_Description                       = "Здесь вы можете настроить оповещения для каждого испытания. От простого включения и выключения до специфического звука или показа оповещения вашим товарищам."


--------------------------------
----     Hel Ra Citadel     ----
--------------------------------
L.Settings_HelRa_Header                   			= "Цитадель Хель Ра (HRC)"
-- Settings
L.Settings_HelRa_Yokeda_Meteor                      = "Йокеда: Meteor"
L.Settings_HelRa_Yokeda_Meteor_TT                   = "Предупреждает вас, когда йокеда выбирает вас своей целью атаки Meteor."
L.Settings_HelRa_Warrior_StoneForm        			= "Воин: Каменная форма"
L.Settings_HelRa_Warrior_StoneForm_TT     			= "Предупреждает вас, когда вы и/или другие будут обращены Воином в камень."
L.Settings_HelRa_Warrior_ShieldThrow      			= "Воин: Бросок щита"
L.Settings_HelRa_Warrior_ShieldThrow_TT   			= "Предупреждает вас, когда Воин готовится бросить свой щит."
--Alerts
L.Alerts_HelRa_Yokeda_Meteor                        = "|cFF0000Meteor|r нацелен на тебя. БЛОКИРУЙ!"
L.Alerts_HelRa_Yokeda_Meteor_Other                  = "|cFF0000Meteor|r нацелен на игрока |c595959<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_StoneForm        			= "|c595959Каменная форма|r начинает действовать на тебя. Не используй синергии!"
L.Alerts_HelRa_Warrior_StoneForm_Other 				= "|c595959Каменная форма|r начинает действовать на |cFF0000<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_ShieldThrow      			= "Начинается |cFF0000Бросок Щита|r. "


--------------------------------
----   Aetherian Archives   ----
--------------------------------
L.Settings_Archive_Header                       	= "Этерианский Архив (AA)"
-- Settings
L.Settings_Archive_StormAtro_ImpendingStorm     	= "Грозовой Атронах: Impending Storm"
L.Settings_Archive_StormAtro_ImpendingStorm_TT  	= "Предупреждает вас, когда Грозовой Атронах готовится применить AoE молниями."
L.Settings_Archive_StormAtro_LightningStorm     	= "Грозовой Атронах: Lightning Storm"
L.Settings_Archive_StormAtro_LightningStorm_TT  	= "Предупреждает вас, когда Грозовой Атронах призывает молнию с небес и вы должны укрыться от неё."
L.Settings_Archive_StoneAtro_BoulderStorm       	= "Каменный Атронах: Boulder Storm"
L.Settings_Archive_StoneAtro_BoulderStorm_TT    	= "Предупреждает вас, когда Каменный Атронах начинает швырять камни в игроков."
L.Settings_Archive_StoneAtro_BigQuake           	= "Каменный Атронах: Big Quake"
L.Settings_Archive_StoneAtro_BigQuake_TT        	= "Предупреждает вас, когда Каменный Атронах начинает бить о землю, вызывая землетрясение, наносящее урон."
L.Settings_Archive_Overcharge            			= "Мобы: Разрядник"
L.Settings_Archive_Overcharge_TT         			= "Предупреждает вас, когда Разрядник выбирает вас своей целью атаки Overcharge."
L.Settings_Archive_Call_Lightning        			= "Мобы: Call Lightning"
L.Settings_Archive_Call_Lightning_TT     			= "Предупреждает вас, когда Разрядник выбирает вас своей целью атаки Call Lightning."
-- Alerts 
L.Alerts_Archive_StormAtro_ImpendingStorm 			= "Начинается |cFF0000Impending Storm|r!"
L.Alerts_Archive_StormAtro_LightningStorm 			= "Начинается |cfef92eLightning Storm|r! ИДИ В КРУГ СВЕТА!"
L.Alerts_Archive_StoneAtro_BoulderStorm 			= "Начинается |cFF0000Boulder Storm|r! Блокируй, чтобы не сбило с ног!"
L.Alerts_Archive_StoneAtro_BigQuake 				= "Начинается |cFF0000Big Quake|r!"
L.Alerts_Archive_Overcharge 						= "|c46edffOvercharge|r нацелена на тебя."
L.Alerts_Archive_Overcharge_Other 					= "|c46edffOvercharge|r нацелена на |cFF0000<<!aC:1>>|r."
L.Alerts_Archive_Call_Lightning 					= "|c46edffCall Lightning|r надвигается на тебя. ДВИГАЙСЯ!"
L.Alerts_Archive_Call_Lightning_Other 				= "|c46edffCall Lightning|r надвигается на |cFF0000<<!aC:1>>|r."


--------------------------------
----    Sanctum Ophidia     ----
--------------------------------
L.Settings_Sanctum_Header                 			= "Святилище Офидии (SO)"
-- Settings
L.Settings_Sanctum_Magicka_Detonation     			= "Змей: Magicka Detonation"
L.Settings_Sanctum_Magicka_Detonation_TT  			= "Предупреждает, когда вы получаете дебафф магической детонации во время битвы со Змеем."
L.Settings_Sanctum_Serpent_Poison         			= "Змей: Poison Phase"
L.Settings_Sanctum_Serpent_Poison_TT      			= "Предупреждает о начале ядовитой фазы во время битвы со Змеем."
L.Settings_Sanctum_Serpent_World_Shaper             = "Змей: World Shaper (Hard Mode)"
L.Settings_Sanctum_Serpent_World_Shaper_TT          = "Предупреждает, когда Змей начинает свою атаку World Shaper, запуская обратный отсчёт до её завершения."
L.Settings_Sanctum_Mantikora_Spear        			= "Мантикора: Spear"
L.Settings_Sanctum_Mantikora_Spear_TT     			= "Предупреждает вас, когда вы получаете копьё Мантикоры."
L.Settings_Sanctum_Mantikora_Quake        			= "Мантикора: Quake"
L.Settings_Sanctum_Mantikora_Quake_TT     			= "Предупреждает, когда вы набираете три землетрясения или руны на Мантикоре."
L.Settings_Sanctum_Troll_Boulder         			= "Мобы: Troll Boulder Toss"
L.Settings_Sanctum_Troll_Boulder_TT      			= "Предупреждает вас, когда тролль готовится бросить булыжник в вас."
L.Settings_Sanctum_Troll_Poison          			= "Мобы: Troll Poison"
L.Settings_Sanctum_Troll_Poison_TT       			= "Предупреждает вас, когда тролль готовится бросить в вас распространяющийся яд."
L.Settings_Sanctum_Overcharge            			= "Мобы: Разрядник"
L.Settings_Sanctum_Overcharge_TT         			= "Предупреждает вас, когда Разрядник выбирает вас своей целью атаки Overcharge."
L.Settings_Sanctum_Call_Lightning        			= "Мобы: Call Lightning"
L.Settings_Sanctum_Call_Lightning_TT     			= "Предупреждает вас, когда Разрядник выбирает вас своей целью атаки Call Lightning."
-- Alerts
L.Alerts_Sanctum_Serpent_Poison0        			= "Наступает |c39942eЯдовитая фаза|r! Соберитесь вместе!"
L.Alerts_Sanctum_Serpent_Poison1        			= "Наступает |c39942eЯдовитая фаза|r! Потом будут |ccc0000Ламии|r."
L.Alerts_Sanctum_Serpent_Poison2        			= "Наступает |c39942eЯдовитая фаза|r! Потом будет |c009933Мантикора (Л)|r." --left
L.Alerts_Sanctum_Serpent_Poison3        			= "Наступает |c39942eЯдовитая фаза|r! Потом будет |c009933Мантикора (П)|r." --right
L.Alerts_Sanctum_Serpent_Poison4        			= "Наступает |c39942eЯдовитая фаза|r! Потом будут |cff33ccЩиты|r."
L.Alerts_Sanctum_Serpent_Poison5        			= "Финальная |c39942eЯдовитая фаза|r!"
L.Alerts_Sanctum_Serpent_World_Shaper               = "|c00c832World Shaper|r через"
L.Alerts_Sanctum_Magicka_Detonation     			= "|c234afaMagicka Detonation|r! СЛЕЙ ВСЮ СВОЮ МАНУ!"
L.Alerts_Sanctum_Mantikora_Spear        			= "|ccde846Spear|r Мантикоры на тебе! УХОДИ!"
L.Alerts_Sanctum_Mantikora_Spear_Other 				= "|ccde846Spear|r Мантикоры на <<!aC:1>>! УХОДИ!"
L.Alerts_Sanctum_Mantikora_Quake        			= "|ccde846Quake|r под тобой! УБИРАЙСЯ!"
L.Alerts_Sanctum_Troll_Poison           			= "|c66ff33Troll Poison|r начинает действовать. НЕ ЗАРАЖАЙ ИМ ДРУГИХ!"
L.Alerts_Sanctum_Troll_Poison_Other    				= "|c66ff33Troll Poison|r на игроке |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Troll_Boulder          			= "Тролль кидает |c595959Boulder Toss|r. УВЕРНИСЬ!"
L.Alerts_Sanctum_Troll_Boulder_Other   				= "Тролль кидает |c595959Boulder Toss|r в игрока |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Overcharge             			= "|c46edffOvercharge|r нацелена на тебя."
L.Alerts_Sanctum_Overcharge_Other     			 	= "|c46edffOvercharge|r нацелена на игрока |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Call_Lightning         			= "|c46edffCall Lightning|r надвигается на тебя. ДВИГАЙСЯ!"
L.Alerts_Sanctum_Call_Lightning_Other  				= "|c46edffCall Lightning|r надвигается на |cFF0000<<!aC:1>>|r."


--------------------------------
----    Maelstrom Arena     ----
--------------------------------
L.Settings_Maelstrom_Header              			= "Вихревая Арена (MSA)"
-- Settings
L.Settings_Maelstrom_Stage7_Poison       			= "Уровень 7: Яд"
L.Settings_Maelstrom_Stage7_Poison_TT    			= "Предупреждает вас, когда вы получаете яд на уровне 7 (Vault of Umbrage)."
L.Settings_Maelstrom_Stage9_Synergy      			= "Уровень 9: Spectral Explosion (Синергия)"
L.Settings_Maelstrom_Stage9_Synergy_TT   			= "Предупреждает вас, когда вы получаете Синергию на уровне 9 (Theater of Despair) после того, как соберёте 3 (золотых) Призрака."
-- Alerts
L.Alerts_Maelstrom_Stage7_Poison 					= "|c39942eЗаражён ядом|r! Используй одну из двух областей, чтобы очиститься!"
L.Alerts_Maelstrom_Stage9_Synergy 					= "|c23afe7Spectral Explosion|r готова! Используй синергию!"


--------------------------------
----     Maw of Lorkhaj     ----
--------------------------------
L.Settings_MawLorkhaj_Header                 		= "Пасть Лорхаджа (MoL)"
-- Settings
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj     		= "Жай'хасса: Grip of Lorkhaj"
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT  		= "Предупреждает, когда дебафф Grip of Lorkhaj начинает действовать на вас."
L.Settings_MawLorkhaj_Zhaj_Glyphs        			= "Жай'хасса: Очищающие платформы (бета)"
L.Settings_MawLorkhaj_Zhaj_Glyphs_TT     			= "Показывает окно со всеми очищающими платформами, с их статусом и временем перезарядки."
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert            = "       - Инвертированый вид"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT         = "Обращает очищающие платформы."
L.Settings_MawLorkhaj_Twin_Aspects           		= "Ложные лунные близнецы: Аспект"
L.Settings_MawLorkhaj_Twin_Aspects_TT        		= "Предупреждает, когда вы получаете лунный или теневой аспекты от Ложных Братьев.\n\n|cFFA500Полный:|r Предупреждает вас, когда вы получаете аспект, когда вы начинаете менять аспект и когда смена завершается.\n|cFFA500Нормальный:|r Предупреждает вас, когда вы получаете аспект и когда вы меняете его.\n|cFFA500Минимальный:|r Предупреждает вас, когда вы меняете аспект."
L.Settings_MawLorkhaj_Twin_Aspects_Status           = "       - Показать статус"
L.Settings_MawLorkhaj_Twin_Aspects_Status_TT        = "Показывает ваш текущий аспект в отображении статуса во время битвы с боссом."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void   	  	= "Ракхат: Unstable Void"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT 	 	= "Предупреждает, когда на вас есть эффект Unstable Void в битве с Ракхатом."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown 		= "       - Отсчёт"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT 	= "Когда включено, показывает обратный отсчёт вместо простого предупреждения об Unstable Void."
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings   		= "Ракхат: Threshing Wings"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT	 	= "Предупреждает, когда Ракхат использует свою способность Threshing Wings, сбивающую вас с ног."
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls    	 	= "Ракхат: Darkness Falls"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT 	 	= "Предупреждает, когда Ракхат использует свою способность Darkness Falls, при которой рушится потолок."
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage     	 	= "Ракхат: Dark Barrage"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT  		= "Предупреждает, когда Ракхат использует свою туннельную способность Dark Barrage на танка."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1     	= "Ракхат: Получение Lunar Bastion"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT  	= "Показывает, когда игрок ПОЛУЧАЕТ благословение со светящейся платформы."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2     	= "Ракхат: Потеря Lunar Bastion"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT  	= "Показывает, когда игрок ТЕРЯЕТ благословение со светящейся платформы."
L.Settings_MawLorkhaj_ShatteringStrike		    	= "Мобы: Shattering Strike"
L.Settings_MawLorkhaj_ShatteringStrike_TT           = "Предупреждает, когда Дикарь дро-м'Атра готовится применить атаку Shattering Strike."
L.Settings_MawLorkhaj_Shattered   		 			= "Мобы: Armor Shattered"
L.Settings_MawLorkhaj_Shattered_TT		 			= "Предупреждает, когда ваша броня разбита."
L.Settings_MawLorkhaj_MarkedForDeath      			= "Мобы: Marked for death (Пантеры)"
L.Settings_MawLorkhaj_MarkedForDeath_TT  			= "Предупреждает, если вы помечены для смерти пантерами Грозного ловчего дро-м'Атра"
L.Settings_MawLorkhaj_Suneater_Eclipse    			= "Мобы: Sun-Eater Eclipse Field (негейт)"
L.Settings_MawLorkhaj_Suneater_Eclipse_TT 			= "Предупреждает, если вы попадаете под действие негейта Eclipse Field."
-- Alerts
L.Alerts_MawLorkhaj_Zhaj_GripOfLorkhaj 				= "Внимание! |c000055Grip of Lorkhaj!|r ОЧИСТИСЬ!"
L.Alerts_MawLorkhaj_Lunar_Aspect 					= "Ты под |cFEFF7FЛунным|r Аспектом!"
L.Alerts_MawLorkhaj_Shadow_Aspect 					= "Ты под Аспектом |c000055Тени|r!"
L.Alerts_MawLorkhaj_Lunar_Conversion 				= "Смена на |cFEFF7FЛунный|r Аспект!"
L.Alerts_MawLorkhaj_Shadow_Conversion 				= "Смена на Аспект |c000055Тени|r!"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void 			= "Внимание! |c000055Unstable Void|r под тобой!"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void_Other		= "Внимание! |c000055Unstable Void|r под |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_Rakkhat_ThreshingWings 			= "Приближается |cFF0000Threshing Wings|r! Блокируй!"
L.Alerts_MawLorkhaj_Rakkhat_DarknessFalls 			= "Приближается |cFF0000Darkness Falls|r!"
L.Alerts_MawLorkhaj_Rakkhat_DarkBarrage 			= "Приближается |cFF0000Dark Barrage|r!"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1 			= "Ты получил |cFEFF7FLunar Bastion|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1_Other 	= "|cFF0000<<!aC:1>>|r получил |cFEFF7FLunar Bastion|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2 			= "Ты потерял |cFEFF7FLunar Bastion|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2_Other 	= "|cFF0000<<!aC:1>>|r потерял |cFEFF7FLunar Bastion|r"
L.Alerts_MawLorkhaj_Suneater_Eclipse 				= "Внимание! |cFF0000Eclipse Field|r действует на тебя!"
L.Alerts_MawLorkhaj_Suneater_Eclipse_Other 			= "Внимание! |cFF0000Eclipse Field|r действует на |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_ShatteringStrike		    	= "|c000055Shattering Strike|r надвигается на тебя."
L.Alerts_MawLorkhaj_ShatteringStrike_Other          = "|c000055Shattering Strike|r надвигается на игрока |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_Shattered 						= "Твоя |c595959Броня|r была |cff0000Разбита|r."
L.Alerts_MawLorkhaj_MarkedForDeath 					= "Внимание! |c000055Пантеры|r преследуют тебя!"


--------------------------------
----    Dragonstar Arena    ----
--------------------------------
L.Settings_Dragonstar_Header              			= "Драгонстарская Арена (DSA)"
-- Settings
L.Settings_Dragonstar_General_Taking_Aim        	= "Общее: Taking Aim"
L.Settings_Dragonstar_General_Taking_Aim_TT     	= "Предупреждает, когда вы становитесь целью способности Taking Aim."
L.Settings_Dragonstar_General_Crystal_Blast     	= "Общее: Crystal Blast"
L.Settings_Dragonstar_General_Crystal_Blast_TT  	= "Предупреждает, когда вы становитесь целью способности Crystal Blast."
L.Settings_Dragonstar_Arena2_Crushing_Shock     	= "Арена 2: Crushing Shock"
L.Settings_Dragonstar_Arena2_Crushing_Shock_TT  	= "Предупреждает, когда вы становитесь целью способности Crushing Shock на Ледяной арене."
L.Settings_Dragonstar_Arena6_Drain_Resource    		= "Арена 6: Drain Resource"
L.Settings_Dragonstar_Arena6_Drain_Resource_TT 		= "Предупреждает, когда вы становитесь целью способности Draining Resource на Босмерской арене."
L.Settings_Dragonstar_Arena7_Unstable_Core      	= "Арена 7: Unstable Core (Eclipse)"
L.Settings_Dragonstar_Arena7_Unstable_Core_TT   	= "Предупреждает, когда на вас накладывается Unstable Core (Eclipse) боссом Храмовником на Жертвенной арене."
L.Settings_Dragonstar_Arena8_Ice_Charge         	= "Арена 8: Ice Charge"
L.Settings_Dragonstar_Arena8_Ice_Charge_TT      	= "Предупреждает, когда Ледяной центурион готов применить свою ледяную атаку."
L.Settings_Dragonstar_Arena8_Fire_Charge        	= "Арена 8: Fire Charge"
L.Settings_Dragonstar_Arena8_Fire_Charge_TT     	= "Предупреждает, когда Огненный центурион готов применить свою огненную атаку."
-- Alerts
L.Alerts_Dragonstar_General_Taking_Aim          	= "Ты стал целью |cFF6600Taking Aim|r!"
L.Alerts_Dragonstar_General_Crystal_Blast       	= "Ты стал целью |c990099Crystal Blast|r!"
L.Alerts_Dragonstar_Arena2_Crushing_Shock       	= "Приближается |c3366EECrushing Shock|r! БЛОКИРУЙ!"
L.Alerts_Dragonstar_Arena6_Drain_Resource       	= "Приближается |c00ff99Draining Resource|r! УВЕРНИСЬ!"
L.Alerts_Dragonstar_Arena6_Drain_Resource_Other		= "|c00ff99Draining Resource|r надвигается на игрока |cFF0000<<!aC:1>>|r."
L.Alerts_Dragonstar_Arena7_Unstable_Core        	= "На тебе |cDDDD33Unstable Core|r! ВЫСВОБОДИСЬ!"
L.Alerts_Dragonstar_Arena8_Ice_Charge           	= "Приближается |c6699FFIce Charge|r на тебя! ПРЕРВИ или УВЕРНИСЬ!"
L.Alerts_Dragonstar_Arena8_Ice_Charge_Other     	= "|c6699FFIce Charge|r применяется на |cFF0000<<!aC:1>>|r. ПРЕРВИ!"
L.Alerts_Dragonstar_Arena8_Fire_Charge          	= "Приближается |cFF3113Fire Charge|r на тебя! ПРЕРВИ или УВЕРНИСЬ!"
L.Alerts_Dragonstar_Arena8_Fire_Charge_Other    	= "|c6699FFire Charge|r применяется на |cFF0000<<!aC:1>>|r. ПРЕРВИ!"



--------------------------------
---- Halls Of Fabrication   ----
--------------------------------
L.Settings_HallsFab_Header                          = "Залы фабрикации (HoF)"
-- Settings
L.Settings_HallsFab_Taking_Aim                      = "Общее: Taking Aim"
L.Settings_HallsFab_Taking_Aim_TT                   = "Предупреждает, когда вы становитесь целью способности Taking Aim."
L.Settings_HallsFab_Taking_Aim_Dynamic              = "       - Отсчёт"
L.Settings_HallsFab_Taking_Aim_Dynamic_TT           = "Когда включено, отображается обратный отсчёт вместо простого предупреждения перед атакой Taking Aim."
L.Settings_HallsFab_Taking_Aim_Duration             = "       - Длительность отсчёта"
L.Settings_HallsFab_Taking_Aim_Duration_TT          = "Длительность отсчёта в миллисекундах."
L.Settings_HallsFab_Draining_Ballista               = "Общее: Draining Ballista"
L.Settings_HallsFab_Draining_Ballista_TT            = "Предупреждает, когда Сферу необходимо сбить."
L.Settings_HallsFab_Conduit_Strike                  = "Общее: Conduit Strike"
L.Settings_HallsFab_Conduit_Strike_TT               = "Предупреждает, когда приближается Conduit Strike."
L.Settings_HallsFab_Power_Leech                     = "Общее: Power Leech"
L.Settings_HallsFab_Power_Leech_TT                  = "Предупреждает, когда вы обездвижены способностью Conduit Strike и необходимо вырваться."
L.Settings_HallsFab_Venom_Injection                 = "Охотники: Venom Injection"
L.Settings_HallsFab_Venom_Injection_TT              = "Показывает статус, когда на вас действует Venom Injection во время битвы с боссом Охотником."
L.Settings_HallsFab_Conduit_Spawn                   = "Вершина: Появление"
L.Settings_HallsFab_Conduit_Spawn_TT                = "Предупреждает, когда трубопровод готов извергнуть босса Вершинный фактотум."
L.Settings_HallsFab_Conduit_Drain                   = "Вершина: Засасывание"
L.Settings_HallsFab_Conduit_Drain_TT                = "Предупреждает, когда трубопровод засасывает тебя к боссу Вершинный фактотум."
L.Settings_HallsFab_Scalded_Debuff                  = "Вершина: Scalded Debuff"
L.Settings_HallsFab_Scalded_Debuff_TT               = "Отображает небольшую иконку статуса, показывающую время до исчезновения и насколько силён дебафф исцеления."
L.Settings_HallsFab_Overcharge_Aura                 = "Комитет: Аура перегрузки"
L.Settings_HallsFab_Overcharge_Aura_TT              = "Предупреждает, когда Регенератор запускает ауру перегрузки."
L.Settings_HallsFab_Overpower_Auras                 = "Комитет: Аура перезаряда"
L.Settings_HallsFab_Overpower_Auras_TT              = "Предупреждает, когда танк должен переключаться между боссами."
L.Settings_HallsFab_Overpower_Auras_Duration        = "       - Длительность отсчёта"
L.Settings_HallsFab_Overpower_Auras_Duration_TT     = "Длительность отсчёта в миллисекундах."
L.Settings_HallsFab_Overpower_Auras_Dynamic         = "       - Динамический отсчёт"
L.Settings_HallsFab_Overpower_Auras_Dynamic_TT      = "Когда включено, аддон попытается остановить отсчёт, как только переключится на другого босса."
L.Settings_HallsFab_Fabricant_Spawn                 = "Комитет: Появление Разрушенного фактотума"
L.Settings_HallsFab_Fabricant_Spawn_TT              = "Предупреждает о появлении Разрушенного фактотума."
L.Settings_HallsFab_Catastrophic_Discharge          = "Комитет: Catastrophic Discharge"
L.Settings_HallsFab_Catastrophic_Discharge_TT       = "Предупреждает, когда Разрушенный фактотум нацеливается на тебя."
L.Settings_HallsFab_Reclaim_Achieve                 = "Комитет: Регенератор Разрушенных архивов"
L.Settings_HallsFab_Reclaim_Achieve_TT              = "Предупреждает, когда бомбер достигает Рагенератора."
-- Alerts
L.Alerts_HallsFab_Taking_Aim                        = "Ты стал целью |cFF6600Taking Aim|r!"
L.Alerts_HallsFab_Taking_Aim_Simple                 = "|cFF6600Taking Aim|r!"
L.Alerts_HallsFab_Taking_Aim_Other                  = "|cFF6600Taking Aim|r нацелен на игрока |cFF0000<<!aC:1>>|r!"
L.Alerts_HallsFab_Conduit_Spawn                     = "Трубопровод готов извергнуть босса"
L.Alerts_HallsFab_Conduit_Drain                     = "Трубопровод засасывает тебя!"
L.Alerts_HallsFab_Conduit_Drain_Other               = "Трубопровод засасывает игрока |cFF0000<<!aC:1>>|r!"
L.Alerts_HallsFab_Conduit_Strike                    = "Приближается |cFF0000Conduit Strike|r. БЛОКИРУЙ!"
L.Alerts_HallsFab_Draining_Ballista                 = "Ты стал целью |cFFC000Draining Ballista|r! БЛОКИРУЙ или ПРЕРВИ!"
L.Alerts_HallsFab_Draining_Ballista_Other           = "|cFFC000Draining Ballista|r нацелен на игрока |cFF0000<<!aC:1>>|r! ПРЕРВИ!"
L.Alerts_HallsFab_Power_Leech                       = "|c6600FFPower Leech|r! ВЫСВОБОДИСЬ!"
L.Alerts_HallsFab_Overcharge_Aura                   = "Аура |c3366EEOvercharging|r на Регенераторе."
L.Alerts_HallsFab_Overpower_Auras                   = "|cFF0000Отсчёт ауры!|r"
L.Alerts_HallsFab_Catastrophic_Discharge            = "Ты стал целью |cFF0000Catastrophic Discharge|r! БЛОКИРУЙ!"
L.Alerts_HallsFab_Fabricant_Spawn                   = "|cFFC000Появление Разрушенного фактотума|r"
L.Alerts_HallsFab_Reclaim_Achieve                   = "Достижение |cDCD822[Планируемое устаревание]|r |cFF0000провалено|r"



--------------------------------
----   Asylum Sanctorium    ----
--------------------------------
L.Settings_Asylum_Header                         = "Изоляционный санктуарий (AS)"
-- Settings
L.Settings_Asylum_Defiling_Blast                 = "Святой Ллотис: Defiling Dye Blast"
L.Settings_Asylum_Defiling_Blast_TT              = "Предупреждает вас, когда Святой Ллотис выбирает вас или других целью своей конусной атаки."
L.Settings_Asylum_Soul_Stained_Corruption        = "Святой Ллотис: Soul Stained Corruption"
L.Settings_Asylum_Soul_Stained_Corruption_TT     = "Предупреждает вас, когда Святой Ллотис выбирает игрока целью своей атаки, которую нужно прервать."
L.Settings_Asylum_Teleport_Strike                = "Святой Фелмс: Teleport Strike"
L.Settings_Asylum_Teleport_Strike_TT             = "Предупреждает вас, когда Святой Фелмс собирается телепортироваться к вам."
L.Settings_Asylum_Exhaustive_Charges             = "Святой Олмс: Exhaustive Charges"
L.Settings_Asylum_Exhaustive_Charges_TT          = "Предупреждает вас, когда Святой Олмс готов начать свою атаку, которая бросает три больших круга молний."
L.Settings_Asylum_Storm_The_Heavens              = "Святой Олмс: Storm the Heavens"
L.Settings_Asylum_Storm_The_Heavens_TT           = "Предупреждает вас, когда Святой Олмс готов подняться в воздух и выпустить большое количество маленьких кружков молний."
L.Settings_Asylum_Gusts_Of_Steam                 = "Святой Олмс: Gusts Of Steam"
L.Settings_Asylum_Gusts_Of_Steam_TT              = "Предупреждает вас, когда Святой Олмс готов прыгнуть взад-вперёд, сигнализируя о следующей фазе битвы."
L.Settings_Asylum_Protector_Spawn                = "Святой Олмс: Protector Spawn"
L.Settings_Asylum_Protector_Spawn_TT             = "Предупреждает вас, когда готова появиться сфера."
L.Settings_Asylum_Trial_By_Fire                  = "Святой Олмс: Trial By Fire"
L.Settings_Asylum_Trial_By_Fire_TT               = "Предупреждает вас, когда Святой Олмс собирается использовать огонь на добивающей фазе."
-- Alerts
L.Alerts_Asylum_Defiling_Blast                   = "Внимание! |c00cc00Defiling Blast|r нацелена на вас!"
L.Alerts_Asylum_Defiling_Blast_Other             = "Внимание! |c00cc00Defiling Blast|r нацелена на игрока |cFF0000<<!aC:1>>|r!"
L.Alerts_Asylum_Soul_Stained_Corruption          = "Приближается |c3366EESoul Stained Corruption|r. ПРЕРВИ!"
L.Alerts_Asylum_Teleport_Strike                  = "|cFFC000Teleport Strike|r нацелен на тебя!"
L.Alerts_Asylum_Teleport_Strike_Other            = "|cFFC000Teleport Strike|r нацелен на игрока |cFF0000<<!aC:1>>|r!"
L.Alerts_Asylum_Exhaustive_Charges               = "Приближается |cFF0000Exhaustive Charges|r!"
L.Alerts_Asylum_Storm_The_Heavens                = "Приближается |cFF0000Storm The Heavens|r! ПЕТЛЯЙ!"
L.Alerts_Asylum_Eruption                         = "|c595959Eruption|r нацелена на тебя!"
L.Alerts_Asylum_Eruption_Other                   = "|c595959Eruption|r нацелена на игрока |cFC0000<<!aC:1>>|r!"
L.Alerts_Asylum_Gusts_Of_Steam                   = "Приближается |cFF9900Gusts Of Steam|r! СПРЯЧЬСЯ!"
L.Alerts_Asylum_Pre_Gusts_Of_Steam               = "|cFF0000<<1>>%|r до |cFF9900прыжка|r! ГОТОВЬСЯ прятаться!"
L.Alerts_Asylum_Trial_By_Fire                    = "Приближается |cFF5500Fire|r!"
L.Alerts_Asylum_Protector_Spawn                  = "Появляется |c0000FFЗащитник|r!"
L.Alerts_Asylum_Protector_Active                 = "|c0000FFЗащитник|r активирован!"



--------------------------------
----       Debugging        ----
--------------------------------
L.Settings_Debug_Header                  = "Отладка"
L.Settings_Debug                         = "Включить отладку"
L.Settings_Debug_TT                      = "Выключает вывод отладочной информации в окно чата"
L.Settings_Debug_DevMode                 = "Dev Mode"
L.Settings_Debug_DevMode_TT              = "Когда включено, срабатывают специальные предупреждения, которые могут функционировать не полностью, иметь неверные тайминги или ещё не полностью оттестированы. Обычно, они не должны вызывать ошибок интерфейса, но всё-таки рекомендуется использовать аддон, который 'ловит ошибки'."
L.Settings_Debug_DevMode_Warning         = "Требуется DevMode"

L.Settings_Debug_Tracker_Header          = "Debug Tracker"
L.Settings_Debug_Tracker_Description     = "Этот функционал отладки отслеживает и выводит потенциальные механики во время прохождения испытания путём вывод информации в информации о боевых событиях и эффектах. Из-за потенциально большого объёма выводимой информации, есть несколько настроек, которые могут помочь вам избежать загромождения окна чата."
L.Settings_Debug_Tracker_Enabled         = "Включено"
L.Settings_Debug_Tracker_SpamControl     = "Контроль спама"
L.Settings_Debug_Tracker_SpamControl_TT  = "С включением этого, каждая способность/эффект выводятся лишь один раз для действия каждого типа. Список всех известных способностей текущей сессии может быть очищен командой \"/rndebug clear\"."
L.Settings_Debug_Tracker_MyEnemyOnly     = "Только мои противники"
L.Settings_Debug_Tracker_MyEnemyOnly_TT  = "КОгда включено, ограничивает вывод информации о способностях/эффектах только теми, которые нацелены на игрока и НЕ исходят от других игроков или группы. Полезно, когда вы ищете определённые вещи и не хотите включать Контроль спама."



--TODO: get rid of this ugly, bulky localization method
for k, v in pairs(L) do
    local string = "RAIDNOTIFIER_" .. string.upper(k)
    ZO_CreateStringId(string, v)
end

if (GetCVar('language.2') == 'ru') then 
	local MissingL = {}
	for k, v in pairs(RaidNotifier:GetLocale()) do
		if (not L[k]) then
			table.insert(MissingL, k)
			L[k] = v
		end
	end
	function RaidNotifier:GetLocale() 
		return L
	end
	-- for debugging 
	function RaidNotifier:MissingLocale()
		df("Missing strings for '%s'", GetCVar('language.2'))
		d(MissingL)
	end
end
