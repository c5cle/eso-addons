-- Spanish translation by Leviatan64 and Inval1d

local L = {}

L.Description                            = "Muestra notificaciones en pantalla sobre diferentes eventos durante las pruebas."

--------------------------------
----     General Stuff      ----
--------------------------------
L.Settings_General_Header                           = "General"
-- Settings
L.Settings_General_Notifications_Showcase           = "Demostración"
L.Settings_General_Bufffood_Reminder                = "Recordatorio de bonif. de comida"
L.Settings_General_Bufffood_Reminder_TT             = "Te avisa cuando no tienes bonificación de comida durante las pruebas o cuando está por acabar (ver más abajo)."
L.Settings_General_Bufffood_Reminder_Interval       = "Intervalo de recordatorio"
L.Settings_General_Bufffood_Reminder_Interval_TT    = "Intervalo, en segundos, en el que aparecerá el recordatorio de bonificación de comida, a partir de los últimos 10 minutos restantes."
L.Settings_General_Vanity_Pets                      = "Desactivar mascotas durante pruebas"
L.Settings_General_Vanity_Pets_TT                   = "Ocultará tus mascotas al comenzar una prueba. Una vez finalizada la prueba, la mascota se mostrará nuevamente."
L.Settings_General_No_Assistants                    = "Apagar asistentes al entrar en combate"
L.Settings_General_No_Assistants_TT                 = "Sólo se aplica durante pruebas y NO impide que sean convocados."
L.Settings_General_Center_Screen_Announce           = "Tipo de anuncio"
L.Settings_General_Center_Screen_Announce_TT        = "El tipo de anuncio que se utilizará.\n\nSólo los anuncios de formato personalizado pueden ser reubicados en la pantalla."
L.Settings_General_NotificationsScale               = "Escala de notificaciones"
L.Settings_General_NotificationsScale_TT            = "La escala en la que se mostrarán las notificaciones y cuentas regresivas menores."
L.Settings_General_UseDisplayName                   = "Mostrar nombre de usuario"
L.Settings_General_UseDisplayName_TT                = "Mostrará el nombre usuario de un jugador en las notificaciones en lugar del nombre de su personaje."
L.Settings_General_Unlock_Status_Icon               = "Desbloquear ícono de estado"
L.Settings_General_Unlock_Status_Icon_TT            = "Al activarse, mostrará un ícono de estado en la pantalla que puede ser movido."
L.Settings_General_Default_Sound                    = "Sonido predeterminado"
L.Settings_General_Default_Sound_TT                 = "El sonido predeterminado que se usará para una notificación."
-- Choices
L.Settings_General_Choices_Off                      = "Desactivado"
L.Settings_General_Choices_Full                     = "Completo"
L.Settings_General_Choices_Normal                   = "Normal"
L.Settings_General_Choices_Minimal                  = "Mínimo"
L.Settings_General_Choices_Self                     = "Sólo yo"
L.Settings_General_Choices_Near                     = "Cercanos"
L.Settings_General_Choices_All                      = "Todos"
L.Settings_General_Choices_Always                   = "Siempre"
L.Settings_General_Choices_Other                    = "Otro"
L.Settings_General_Choices_Inverted                 = "Invertido"
L.Settings_General_Choices_Small_Announcement       = "Pequeño (estático, obsoleto)"
L.Settings_General_Choices_Large_Announcement       = "Grande (estático, obsoleto)"
L.Settings_General_Choices_Major_Announcement       = "Enorme (estático, obsoleto)"
L.Settings_General_Choices_1s                       = "1s"
L.Settings_General_Choices_500ms                    = "0,5s"
L.Settings_General_Choices_200ms                    = "0,2s"
L.Settings_General_Choices_Custom                   = "Personalizado"
L.Settings_General_Choices_Custom_Announcement      = "Personalizado (movible)"
L.Settings_General_Choices_OnlyChaurusTotem         = "Sólo cauros" -- Specific for Kyne's Aegis
-- Alerts
L.Alerts_General_No_Bufffood                        = "¡No tienes una bonificación de comida!"
L.Alerts_General_Bufffood_Minutes                   = "¡La bonificación de tu '<<1>>' se agotará en |cbd0000<<2>>|r minutos!"
-- Bindings
L.Binding_ToggleUltimateExchange                    = "Alternar Máxima"


--------------------------------
----    Ultimate Exchange   ----
--------------------------------
L.Settings_Ultimate_Header                          = "Intercambio de Máxima (beta)"
L.Settings_Ultimate_Description                     = "Esta función te permite enviar información de tus puntos de Máxima a tus compañeros de equipo para que puedan ver lo cerca que estás de lanzar la habilidad. Utiliza tu costo basado en cualquier reducción de costos que puedas tener de armaduras o pasivas."
-- Settings
L.Settings_Ultimate_Enabled                         = "Habilitado"
L.Settings_Ultimate_Enabled_TT                      = "Habilita el uso compartido y la recepción de información de habilidades máximas. Siempre está inhabilitado fuera de pruebas."
L.Settings_Ultimate_Hidden                          = "Oculto"
L.Settings_Ultimate_Hidden_TT                       = "Oculta la ventana de máximas, pero no deshabilita la característica en sí."
L.Settings_Ultimate_UseColor                        = "Usar color"
L.Settings_Ultimate_UseColor_TT                     = "Da a la habilidad máxima de alguien un color basado en los umbrales al 80 y 100 por ciento."
L.Settings_Ultimate_UseDisplayName                  = "Mostrar nombre de usuario"
L.Settings_Ultimate_UseDisplayName_TT               = "Muestra el nombre de usuario en la ventana de máxima en lugar del nombre del personaje."
L.Settings_Ultimate_ShowHealers                     = "Mostrar para sanadores"
L.Settings_Ultimate_ShowHealers_TT                  = "Muestra la habilidad máxima de los miembros del grupo con el rol de sanador."
L.Settings_Ultimate_ShowTanks                       = "Mostrar para tanques"
L.Settings_Ultimate_ShowTanks_TT                    = "Muestra la habilidad máxima de los miembros del grupo con el rol de tanque."
L.Settings_Ultimate_ShowDps                         = "Mostrar para daño"
L.Settings_Ultimate_ShowDps_TT                      = "Mostrar la habilidad máxima de los miembros del grupo con el rol de daño."
L.Settings_Ultimate_TargetUlti                      = "Habilidad máxima"
L.Settings_Ultimate_TargetUlti_TT                   = "Qué habilidad máxima se utilizará para el valor porcentual visto por otros."
L.Settings_Ultimate_OverrideCost                    = "Reemplazar costo"
L.Settings_Ultimate_OverrideCost_TT                 = "Utiliza este valor al enviar el costo de tu habilidad máxima a otros. Si se establece en 0, se deshabilitará el reemplazo."


--------------------------------
----        Profiles        ----
--------------------------------
L.Settings_Profile_Header                           = "Perfiles"
L.Settings_Profile_Description                      = "Puedes gestionar los perfiles de ajustes desde aquí. Incluye la opción de habilitar un perfil global que aplicará los mismos ajustes a TODOS los personajes de la cuenta. Debido a la permanencia de estas opciones, la gestión debe activarse primero mediante la casilla de verificación situada en la parte inferior del panel."
L.Settings_Profile_UseGlobal                        = "Aplicar configuración globalmente"
L.Settings_Profile_UseGlobal_Warning                = "Cambiar entre perfiles locales y globales recargará la interfaz."
L.Settings_Profile_Copy                             = "Seleccionar perfil a copiar"
L.Settings_Profile_Copy_TT                          = "Selecciona un perfil para copiar su ajustes al perfil activo actualmente. El perfil activo se aplicará al personaje actual o globalmente si está habilitada esa función. El perfil existente se sobrescribirá de forma permanente.\n\n¡Esta acción no puede revertirse!"
L.Settings_Profile_CopyButton                       = "Copiar perfil"
L.Settings_Profile_CopyButton_Warning               = "Copiar un perfil recargará la interfaz."
L.Settings_Profile_CopyCannotCopy                   = "No se puede copiar el perfil seleccionado. Inténtalo de nuevo o selecciona otro perfil."
L.Settings_Profile_Delete                           = "Seleccionar perfil para eliminar"
L.Settings_Profile_Delete_TT                        = "Selecciona un perfil para eliminar sus ajustes de la base de datos. Si inicias sesión más tarde en este personaje y no se le aplican los ajustes globales, se creará un perfil con ajustes predeterminados.n\n¡Un perfil eliminado no podrá ser recuperado!"
L.Settings_Profile_DeleteButton                     = "Eliminar perfil"
L.Settings_Profile_Guard                            = "Habilitar la gestión de perfiles"


--------------------------------
----       Countdowns       ----
--------------------------------
L.Settings_Countdown_Header                         = "Cuentas regresivas"
L.Settings_Countdown_Description                    = "Cambia la apariencia y el comportamiento las cuentas regresivas."
L.Settings_Countdown_TimerScale                     = "Tamaño del temporizador principal (obsoleto)"
L.Settings_Countdown_TimerScale_TT                  = "Tamaño de la pantalla del temporizado.r"
L.Settings_Countdown_TextScale                      = "Tamaño de texto principal (obsoleto)"
L.Settings_Countdown_TextScale_TT                   = "El tamaño de la visualización del texto."
L.Settings_Countdown_TimerPrecise                   = "Temporizador preciso"
L.Settings_Countdown_TimerPrecise_TT                = "Ajusta el temporizador preciso para la cuenta regresiva."
L.Settings_Countdown_UseColors                      = "Usar colores"
L.Settings_Countdown_UseColors_TT                   = "Al activarse, utilizará colores amarillos/naranja/rojos para la cuenta regresiva hasta que llegue a cero."


--------------------------------
----          Trials        ----
--------------------------------
L.Settings_Trials_Header                            = "Pruebas"
L.Settings_Trials_Description                       = "Aquí podrás configurar las notificaciones para cada prueba. Todas tienen un sonido configurable y muchas de ellas os ayudará no solo a ti, sino también a tus compañeros de equipo."


------------------------------------------------------
----     Hel Ra Citadel / Ciudadela de Hel Ra     ----
------------------------------------------------------
L.Settings_HelRa_Header                             = "Hel Ra Citadel / Ciudadela de Hel Ra"
-- Settings
L.Settings_HelRa_Yokeda_Meteor                      = "Yokeda: Meteoro"
L.Settings_HelRa_Yokeda_Meteor_TT                   = "Te avisa cuando el yokeda está a punto de atacar con meteoro."
L.Settings_HelRa_Warrior_StoneForm                  = "El Guerrero: Forma de piedra"
L.Settings_HelRa_Warrior_StoneForm_TT               = "Te avisa cuando tú y/o otros están a punto de ser convertidos en piedra por El Guerrero."
L.Settings_HelRa_Warrior_ShieldThrow                = "Lanzamiento de escudo de El Guerrero"
L.Settings_HelRa_Warrior_ShieldThrow_TT             = "Te avisa cuando El Guerrero está a punto de lanzar su escudo."
--Alerts
L.Alerts_HelRa_Yokeda_Meteor                        = "|cFF0000Meteoro|r inminente sobre ti. ¡Bloquea!"
L.Alerts_HelRa_Yokeda_Meteor_Other                  = "|cFF0000Meteoro|r inminente sobre |c595959<<!C:1>>|r."
L.Alerts_HelRa_Warrior_StoneForm                    = "|c595959Forma de piedra|r inminente sobre ti. ¡No uses sinergias!"
L.Alerts_HelRa_Warrior_StoneForm_Other              = "|c595959Forma de piedra|r inminente sobre |cFF0000<<!C:1>>|r."
L.Alerts_HelRa_Warrior_ShieldThrow                  = "|cFF0000Lanzamiento de escudo|r inminente. "


---------------------------------------------------
----   Aetherian Archives / Archivo Aetérico   ----
---------------------------------------------------
L.Settings_Archive_Header                           = "Aetherian Archives / Archivo Aetérico"
-- Settings
L.Settings_Archive_StormAtro_ImpendingStorm         = "Atronach de la tormenta: Tormenta inminente"
L.Settings_Archive_StormAtro_ImpendingStorm_TT      = "Te avisa cuando el atronach de la tormenta está a punto de hacer su gran ataque de área."
L.Settings_Archive_StormAtro_LightningStorm         = "Atronach de la tormenta: Tormenta eléctrica"
L.Settings_Archive_StormAtro_LightningStorm_TT      = "Te avisa cuando el atronach de la tormenta invoque un relámpago del cielo del que necesites refugiarte."
L.Settings_Archive_StoneAtro_BoulderStorm           = "Atronach de piedra: Tormenta pétrea"
L.Settings_Archive_StoneAtro_BoulderStorm_TT        = "Te avisa cuando el atronach de piedra comience a arrojar rocas a la gente."
L.Settings_Archive_StoneAtro_BigQuake               = "Atronach de piedra: Gran terremoto"
L.Settings_Archive_StoneAtro_BigQuake_TT            = "Te avisa cuando el atronach de piedra comience a pisotear el suelo."
L.Settings_Archive_Overcharge                       = "Mobs: Sobrecarga"
L.Settings_Archive_Overcharge_TT                    = "Te avisa cuando un sobrecargador te apunta con su habilidad Sobrecarga."
L.Settings_Archive_Call_Lightning                   = "Mobs: Invocación de relámpagos"
L.Settings_Archive_Call_Lightning_TT                = "Te avisa cuando un sobrecargador te apunta con su habilidad Invocación de relámpagos."
-- Alerts
L.Alerts_Archive_StormAtro_ImpendingStorm           = "¡Aproximándose |cFF0000Tormenta inminente|r!"
L.Alerts_Archive_StormAtro_LightningStorm           = "¡|cfef92eTormenta eléctrica|r inminente! ¡Ve a la luz!"
L.Alerts_Archive_StoneAtro_BoulderStorm             = "¡|cFF0000Tormenta de piedra|r inminente! ¡Bloquea para evitar ser derribado!"
L.Alerts_Archive_StoneAtro_BigQuake                 = "¡|cFF0000Gran terremoto|r inminente!"
L.Alerts_Archive_Overcharge                         = "¡|c46edffSobrecarga|r inminente sobre ti."
L.Alerts_Archive_Overcharge_Other                   = "¡|c46edffSobrecarga|r sobre |cFF0000<<!C:1>>|r."
L.Alerts_Archive_Call_Lightning                     = "¡|c46edffInvocación de relámpagos|r inminente sobre ti. ¡Sigue moviéndote!"
L.Alerts_Archive_Call_Lightning_Other               = "¡|c46edffInvocación de relámpagos|r inminente sobre |cFF0000<<!C:1>>|r."


--------------------------------
----    Sanctum Ophidia     ----
--------------------------------
L.Settings_Sanctum_Header                           = "Sanctum Ophidia"
-- Settings
L.Settings_Sanctum_Magicka_Detonation               = "La Serpiente: Detonación mágica"
L.Settings_Sanctum_Magicka_Detonation_TT            = "Te avisa cuando tienes el efecto negativo de detonación mágica durante la pelea contra La Serpiente."
L.Settings_Sanctum_Serpent_Poison                   = "La Serpiente: Fase de veneno"
L.Settings_Sanctum_Serpent_Poison_TT                = "Te avisa cuando comience la fase de veneno durante la pelea contra La Serpiente."
L.Settings_Sanctum_Serpent_World_Shaper             = "La Serpiente: Terraformación (modo difícil)"
L.Settings_Sanctum_Serpent_World_Shaper_TT          = "Te avisa cuando La Serpiente comienza su ataque Terraformación, contando hasta que es desatado."
L.Settings_Sanctum_Mantikora_Spear                  = "Mantikora: Lanza"
L.Settings_Sanctum_Mantikora_Spear_TT               = "Te avisa cuando seas objetivo de la lanza de la mantikora."
L.Settings_Sanctum_Mantikora_Quake                  = "Mantikora: Terremoto"
L.Settings_Sanctum_Mantikora_Quake_TT               = "Te avisa cuando seas objetivo de los tres terremotos o runas de la mantikora."
L.Settings_Sanctum_Troll_Boulder                    = "Mobs: Lanzamiento de roca del trol"
L.Settings_Sanctum_Troll_Boulder_TT                 = "Te avisa cuando un trol se prepara para lanzarte una roca."
L.Settings_Sanctum_Troll_Poison                     = "Mobs: Veneno de trol"
L.Settings_Sanctum_Troll_Poison_TT                  = "Te avisa cuando un trol se prepara para lanzarte veneno contagioso."
L.Settings_Sanctum_Overcharge                       = "Mobs: Sobrecarga"
L.Settings_Sanctum_Overcharge_TT                    = "Te avisa cuando un sobrecargador te apunta con su habilidad Sobrecarga."
L.Settings_Sanctum_Call_Lightning                   = "Mobs: Invocación de relámpagos"
L.Settings_Sanctum_Call_Lightning_TT                = "Te avisa cuando un sobrecargador te apunta con su habilidad Invocación de relámpagos."
-- Alerts
L.Alerts_Sanctum_Serpent_Poison0                    = "¡|c39942eFase de veneno|r inminente! ¡Amontónense todos!"
L.Alerts_Sanctum_Serpent_Poison1                    = "¡|c39942eFase de veneno|r inminente! Seguido por |ccc0000lamias|r."
L.Alerts_Sanctum_Serpent_Poison2                    = "¡|c39942eFase de veneno|r inminente! Seguido por |c009933mantikoras|r." --left
L.Alerts_Sanctum_Serpent_Poison3                    = "¡|c39942eFase de veneno|r inminente! Seguido por |c009933mantikoras|r." --right
L.Alerts_Sanctum_Serpent_Poison4                    = "¡|c39942eFase de veneno|r inminente! Seguido por |cff33ccescudos|r."
L.Alerts_Sanctum_Serpent_Poison5                    = "¡|c39942eFase de veneno|r final!"
L.Alerts_Sanctum_Serpent_World_Shaper               = "|c00c832Terraformación|r en"
L.Alerts_Sanctum_Magicka_Detonation                 = "¡|c234afaDetonación mágica|r! ¡Gasta toda tu magia!"
L.Alerts_Sanctum_Mantikora_Spear                    = "¡Mantikora |ccde846Lanza|r sobre ti ¡Alejate!"
L.Alerts_Sanctum_Mantikora_Spear_Other              = "¡Mantikora |ccde846Lanza|r sobre <<C:1>>! ¡Alejate!"
L.Alerts_Sanctum_Mantikora_Quake                    = "¡Mantikora |ccde846Terremoto|r debajo de ti! ¡Aléjate!"
L.Alerts_Sanctum_Troll_Poison                       = "|c66ff33Veneno del trol|r inminente. ¡No lo esparzas!"
L.Alerts_Sanctum_Troll_Poison_Other                 = "|c66ff33Veneno del trol|r inminente sobre |cFF0000<<!C:1>>|r."
L.Alerts_Sanctum_Troll_Boulder                      = "|c595959Lanzamiento de roca|r inminente. ¡Esquivalo!"
L.Alerts_Sanctum_Troll_Boulder_Other                = "|c595959Lanzamiento de roca|r inminente sobre |cFF0000<<!C:1>>|r."
L.Alerts_Sanctum_Overcharge                         = "|c46edffSobrecarga|r inminente sobre ti."
L.Alerts_Sanctum_Overcharge_Other                   = "|c46edffSobrecarga|r inminente sobre |cFF0000<<!C:1>>|r."
L.Alerts_Sanctum_Call_Lightning                     = "|c46edffInvocación de relámpagos|r inminente sobre ti. ¡Sigue moviéndote!"
L.Alerts_Sanctum_Call_Lightning_Other               = "|c46edffInvocación de relámpagos|r inminente sobre |cFF0000<<!C:1>>|r."


--------------------------------------------------
----    Maelstrom Arena / Arena Maelstrom     ----
--------------------------------------------------
L.Settings_Maelstrom_Header                         = "Maelstrom Arena / Arena Maelstrom"
-- Settings
L.Settings_Maelstrom_Stage7_Poison                  = "Etapa 7: Veneno"
L.Settings_Maelstrom_Stage7_Poison_TT               = "Te avisa cuando seas envenenado durante la etapa 7 (Cripta del Resentimiento)."
L.Settings_Maelstrom_Stage9_Synergy                 = "Etapa 9: Explosión espectral (sinergia)"
L.Settings_Maelstrom_Stage9_Synergy_TT              = "Te avisa cuando tengas la sinergia en la etapa 9 (Teatro de la Desesperación) tras recoger 3 fantasmas dorados."
-- Alerts
L.Alerts_Maelstrom_Stage7_Poison                    = "¡|c39942eEnvenenado|r! ¡Dirígete una de las dos áreas para purificarte!"
L.Alerts_Maelstrom_Stage9_Synergy                   = "¡|c23afe7Explosión espectral|r lista! ¡Usa la sinergia!"


---------------------------------------------------
----     Maw of Lorkhaj / Fauces de Lorkhaj    ----
---------------------------------------------------
L.Settings_MawLorkhaj_Header                                = "Maw of Lorkhaj / Fauces de Lorkhaj"
-- Settings
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj                    = "Zhaj'hassa: Agarre de Lorkhaj"
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT                 = "Muestra una advertencia cuando el agarre de Lorkhaj comience a afectarte."
L.Settings_MawLorkhaj_Zhaj_Glyphs                           = "Zhaj'hassa: Plataformas de purificación (beta)"
L.Settings_MawLorkhaj_Zhaj_Glyphs_TT                        = "Muestra una ventana con todas las plataformas de purificación, su estado y tiempo de reaparición."
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert                    = "       - Vista invertida"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT                 = "Invertir plataformas de purificación."
L.Settings_MawLorkhaj_Twin_Aspects                          = "Gemelos de la Luna Falsa: Aspectos"
L.Settings_MawLorkhaj_Twin_Aspects_TT                       = "Te avisa cuando obtienes el aspecto Lunar o Sombrío durante la pelea contra los Gemelos de Luna Falsa.\n\n    'Completo' te avisará cuando obtengas un aspecto, cuando comience a convertirse y una vez se haya convertido.\n     'Normal' te avisará cuando obtengas un aspecto y cuando comience a convertirse.\n    'Mínimo' sólo te avisará cuando comience a convertirse."
L.Settings_MawLorkhaj_Twin_Aspects_Status                   = "       - Mostrar estado"
L.Settings_MawLorkhaj_Twin_Aspects_Status_TT                = "Muestra tu aspecto actual en la pantalla de estado durante la pelea con los jefes"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void                 = "Rakkhat: Vacío inestable"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT              = "Te avisa cuando tienes el efecto Vacío inestable en Rakkhat."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown       = "       - Cuenta regresiva"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT    = "Cuando está habilitado, mostrará la cuenta regresiva en lugar de una simple notificación para el Vacío inestable."
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings                = "Rakkhat: Alas trilladoras"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT             = "Te avisa cuando Rakkhat utiliza su habilidad Alas trilladoras, la cual puede derribarte."
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls                 = "Rakkhat: Lluvia de oscuridad"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT              = "Te avisa cuando Rakkhat utiliza su habilidad Lluvia de oscuridad, donde el techo comienza a derrumbarse."
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage                   = "Rakkhat: Descarga sombría"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT                = "Alerta cuando Rakkhat usa su habilidad canalizada Descarga Sombría sobre el tanque."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1                 = "Rakkhat: Bastión lunar obtenido"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT              = "Muestra cuando un jugador obtiene la bendición de la plataforma resplandeciente."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2                 = "Rakkhat: Bastión lunar perdido"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT              = "Muestra cuando un jugador pierde la bendición de la plataforma resplandeciente."
L.Settings_MawLorkhaj_Hulk_ArmorWeakened                    = "Coloso: Armadura debilitada"
L.Settings_MawLorkhaj_Hulk_ArmorWeakened_TT                 = "Te avisa cuando el coloso dro'm-Athra aplica una carga de Armadura debilitada con su ataque Aplastamiento atronador. No debes tener más de dos cargas o el año que recibas será demasiado alto."
L.Settings_MawLorkhaj_ShatteringStrike                      = "Mobs: Impacto devastador"
L.Settings_MawLorkhaj_ShatteringStrike_TT                   = "Muestra una advertencia cuando un salvaje dro-m'Athra esté a punto de atacar con Impacto devastador."
L.Settings_MawLorkhaj_Shattered                             = "Mobs: Armadura destrozada"
L.Settings_MawLorkhaj_Shattered_TT                          = "Muestra una advertencia cuando tu armadura esté destrozada."
L.Settings_MawLorkhaj_MarkedForDeath                        = "Mobs: Marca de la muerte (panteras)"
L.Settings_MawLorkhaj_MarkedForDeath_TT                     = "Muestra una advertencia si recibes la Marca de la muerte de las panteras de un rastreador del miedo dro-m'Athra."
L.Settings_MawLorkhaj_Suneater_Eclipse                      = "Mobs: Campo de eclipse de devorasoles (anulación)"
L.Settings_MawLorkhaj_Suneater_Eclipse_TT                   = "Muestra una advertencia si el Campo de eclipse está sobre ti."
-- Alerts
L.Alerts_MawLorkhaj_Zhaj_GripOfLorkhaj              = "¡Advertencia! |c000055¡Agarre de Lorkhaj!|r ¡Purifícate de inmediato!"
L.Alerts_MawLorkhaj_Lunar_Aspect                    = "Recibido aspecto |cFEFF7FLunar|r."
L.Alerts_MawLorkhaj_Shadow_Aspect                   = "Recibido aspecto |c000055Sombrío|r."
L.Alerts_MawLorkhaj_Lunar_Conversion                = "Convirtiendo a aspecto |cFEFF7FLunar|r."
L.Alerts_MawLorkhaj_Shadow_Conversion               = "Convirtiendo a aspecto |c000055Sombrío|r."
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void           = "¡Peligro! |c000055Vacío inestable|r debajo de ti."
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void_Other     = "¡Peligro! |c000055Vacío inestable|r debajo de |cFF0000<<C:1>>|r."
L.Alerts_MawLorkhaj_Rakkhat_ThreshingWings          = "¡|cFF0000Alas trilladoras|r inminente! ¡Bloquea!"
L.Alerts_MawLorkhaj_Rakkhat_DarknessFalls           = "¡|cFF0000Lluvia de tinieblas|r inminente!"
L.Alerts_MawLorkhaj_Rakkhat_DarkBarrage             = "|cFF0000Descarga sombría|r inminente."
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1           = "Obtienes |cFEFF7FBastión lunar|r."
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1_Other     = "|cFF0000<<C:1>>|r obtuvo |cFEFF7FBastión lunar|r."
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2           = "Perdiste |cFEFF7FBastión lunar|r."
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2_Other     = "|cFF0000<<C:1>>|r perdió |cFEFF7FBastión lunar|r."
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened1             = "Tienes 1 carga de |c000055Armadura debilitada|r."
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened1_Other       = "|cFF0000<<!aC:1>>|r tiene  1 carga de |c000055Armadura debilitada|r."
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened2             = "¡Tienes |cFF00002 cargas|r de |c000055Armadura debilitada|r!"
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened2_Other       = "¡|cFF0000<<!aC:1>>|r tiene |cFF00002 cargas|r |c000055Armadura debilitada|r!"
L.Alerts_MawLorkhaj_Suneater_Eclipse                = "|cFF0000Campo de eclipse|r inminente sobre ti."
L.Alerts_MawLorkhaj_Suneater_Eclipse_Other          = "¡|cFF0000Campo de eclipse|r inminente sobre |cFF0000<<C:1>>|r!"
L.Alerts_MawLorkhaj_ShatteringStrike                = "|c000055Impacto devastador|r inminente sobre ti."
L.Alerts_MawLorkhaj_ShatteringStrike_Other          = "¡|c000055Impacto devastador|r inminente sobre |cFF0000<<C:1>>|r!"
L.Alerts_MawLorkhaj_Shattered                       = "Tu |c595959armadurar|r ha sido |cff0000destrozada|r."
L.Alerts_MawLorkhaj_MarkedForDeath                  = "¡Advertencia! ¡|c000055Panteras|r persiguiéndote!"


---------------------------------------------------------------
----    Dragonstar Arena / Arena de Estrella del Dragón    ----
---------------------------------------------------------------
L.Settings_Dragonstar_Header                        = "Dragonstar Arena / Arena de Estrella del Dragón"
-- Settings
L.Settings_Dragonstar_General_Taking_Aim            = "General: En la mira"
L.Settings_Dragonstar_General_Taking_Aim_TT         = "Te avisa cuando estés siendo objetivo de la habilidad En la mira."
L.Settings_Dragonstar_General_Crystal_Blast         = "General: Explosión de cristal"
L.Settings_Dragonstar_General_Crystal_Blast_TT      = "Te avisa cuando estés siendo objetivo de la habilidad Explosión de cristal."
L.Settings_Dragonstar_Arena2_Crushing_Shock         = "Arena 2: Choque aplastante"
L.Settings_Dragonstar_Arena2_Crushing_Shock_TT      = "Te avisa cuando estés siendo objetivo de la habilidad Choque aplastante en la arena de hielo."
L.Settings_Dragonstar_Arena6_Drain_Resource         = "Arena 6: Drenado de recursos"
L.Settings_Dragonstar_Arena6_Drain_Resource_TT      = "Te avisa cuando estés siendo objetivo de las flechas venenosas de Drenado de recursos en la arena bosmer."
L.Settings_Dragonstar_Arena7_Unstable_Core          = "Arena 7: Núcleo inestable (eclipse)"
L.Settings_Dragonstar_Arena7_Unstable_Core_TT       = "Te avisa cuando un Núcleo inestable (eclipse) ha sido colocado sobre ti por el jefe templario en la arena del sacrificio."
L.Settings_Dragonstar_Arena8_Ice_Charge             = "Arena 8: Carga glacial"
L.Settings_Dragonstar_Arena8_Ice_Charge_TT          = "Te avisa cuando un centurión gélido está a punto de lanzar su ataque de hielo."
L.Settings_Dragonstar_Arena8_Fire_Charge            = "Arena 8: Carga ígnea"
L.Settings_Dragonstar_Arena8_Fire_Charge_TT         = "Te avisa cuando un centurión ígneo está a punto de lanzar su ataque de fuego."
-- Alerts
L.Alerts_Dragonstar_General_Taking_Aim              = "¡Estás |cFF6600En la mira|r!"
L.Alerts_Dragonstar_General_Crystal_Blast           = "¡|c990099 Explosión de cristal|r apuntándote!"
L.Alerts_Dragonstar_Arena2_Crushing_Shock           = "¡|c3366EEChoque aplastante|r inminente! ¡Bloquea!"
L.Alerts_Dragonstar_Arena6_Drain_Resource           = "¡|c00CC00Drenado de recursos|r inminente! ¡Esquiva!"
L.Alerts_Dragonstar_Arena6_Drain_Resource_Other     = "|c00CC00Drenado de recursos|r inminente sobre |cFF0000<<C:1>>|r."
L.Alerts_Dragonstar_Arena7_Unstable_Core            = "¡Tienes |cDDDD33Núcleo inestable|r! ¡Libérate!"
L.Alerts_Dragonstar_Arena8_Ice_Charge               = "¡|c6699FFCarga glacial|r inminente sobre ti! ¡Interrumpe o esquiva!"
L.Alerts_Dragonstar_Arena8_Ice_Charge_Other         = "|c6699FFCarga glacial|r está siendo conjurada sobre |cFF0000<<C:1>>|r. ¡Interrumpe!"
L.Alerts_Dragonstar_Arena8_Fire_Charge              = "¡|cFF3113Carga ígnea|r inminente sobre ti! ¡Interrumpe o esquiva!"
L.Alerts_Dragonstar_Arena8_Fire_Charge_Other        = "|c6699FCarga ígnea|r esta siendo conjurada sobre |cFF0000<<C:1>>|r. ¡Interrumpe!"



---------------------------------------------------------
---- Halls Of Fabrication / Salones de Fabricación   ----
---------------------------------------------------------
L.Settings_HallsFab_Header                          = "Halls Of Fabrication / Salones de Fabricación"
-- Settings
L.Settings_HallsFab_Taking_Aim                      = "General: En la mira"
L.Settings_HallsFab_Taking_Aim_TT                   = "Te avisa cuando estés siendo objetivo de la habilidad En la mira."
L.Settings_HallsFab_Taking_Aim_Dynamic              = "       - Cuenta regresiva"
L.Settings_HallsFab_Taking_Aim_Dynamic_TT           = "Cuando está activado, mostrará la cuenta regresiva en lugar de una simple notificación antes del ataque En la mira."
L.Settings_HallsFab_Taking_Aim_Duration             = "       - Duración de la cuenta regresiva"
L.Settings_HallsFab_Taking_Aim_Duration_TT          = "La duración de la cuenta regresiva en milisegundos."
L.Settings_HallsFab_Draining_Ballista               = "General: Balista drenadora"
L.Settings_HallsFab_Draining_Ballista_TT            = "Te avisa cuando se haya que interrumpir el ataque de la esfera."
L.Settings_HallsFab_Conduit_Strike                  = "General: Golpe conductor"
L.Settings_HallsFab_Conduit_Strike_TT               = "Te avisa cuando Golpe conductor se aproxime."
L.Settings_HallsFab_Power_Leech                     = "General: Descarga drenadora"
L.Settings_HallsFab_Power_Leech_TT                  = "Te avisa cuando seas aturdido por Golpe conductor y necesites liberarte."
L.Settings_HallsFab_Venom_Injection                 = "Cazadores: Inyección de veneno"
L.Settings_HallsFab_Venom_Injection_TT              = "Muestra una pantalla de estado para cuando te aflija Inyección de veneno durante los jefes cazadores."
L.Settings_HallsFab_Conduit_Spawn                   = "Pináculo: Aparición de conductos"
L.Settings_HallsFab_Conduit_Spawn_TT                = "Te avisa cuando un conducto esté siendo apareciendo durante el combate contra el jefe factótum del pináculo."
L.Settings_HallsFab_Conduit_Drain                   = "Pináculo: Conducto drenador"
L.Settings_HallsFab_Conduit_Drain_TT                = "Te avisa cuando un conducto te esté drenando durante el jefe factótum del pináculo."
L.Settings_HallsFab_Scalded_Debuff                  = "Pináculo: Efecto neg. Escaldado"
L.Settings_HallsFab_Scalded_Debuff_TT               = "Muestra un pequeño icono de estado que informa el tiempo hasta desaparezca y qué tan grande es el efecto negativo de curación."
L.Settings_HallsFab_Overcharge_Aura                 = "Comité: Aura sobrecargada"
L.Settings_HallsFab_Overcharge_Aura_TT              = "Te avisa cuando el Reclamador comienza a sobrecargar su aura."
L.Settings_HallsFab_Overpower_Auras                 = "Comité: Auras abrumadoras"
L.Settings_HallsFab_Overpower_Auras_TT              = "Te avisa cuando los tanques necesiten intercambiarse de jefes del comité."
L.Settings_HallsFab_Overpower_Auras_Duration        = "       - Duración de la cuenta regresiva"
L.Settings_HallsFab_Overpower_Auras_Duration_TT     = "La duración de la cuenta regresiva en milisegundos."
L.Settings_HallsFab_Overpower_Auras_Dynamic         = "       - Cuenta atrás dinámica"
L.Settings_HallsFab_Overpower_Auras_Dynamic_TT      = "Cuando está activado, intentará detener la cuenta regresiva una vez que los tanques hayan intercambiado jefes."
L.Settings_HallsFab_Fabricant_Spawn                 = "Comité: Aparición de fabricantes averiados"
L.Settings_HallsFab_Fabricant_Spawn_TT              = "Te avisa cuando un fabricante averiado esté apareciendo."
L.Settings_HallsFab_Catastrophic_Discharge          = "Comité: Descarga catastrófica"
L.Settings_HallsFab_Catastrophic_Discharge_TT       = "Te avisa cuando un fabricante averiado empieza a cargar contra ti."
L.Settings_HallsFab_Reclaim_Achieve                 = "Comité: Reclama el averiado - logro fallido"
L.Settings_HallsFab_Reclaim_Achieve_TT              = "Te avisa cuando el bombardero llega hasta el Reclamador."
-- Alerts
L.Alerts_HallsFab_Taking_Aim                        = "¡Estás |cFF6600En la mira|r!"
L.Alerts_HallsFab_Taking_Aim_Other                  = "¡|cFF0000<<C:1>>|r está |cFF6600En la mira|r!"
L.Alerts_HallsFab_Taking_Aim_Simple                 = "|cFF6600En la mira|r."
L.Alerts_HallsFab_Conduit_Spawn                     = "Un conducto está a punto de aparecer."
L.Alerts_HallsFab_Conduit_Drain                     = "¡Un conducto te esta drenando!"
L.Alerts_HallsFab_Conduit_Drain_Other               = "¡Un conducto esta drenando a |cFF0000<<C:1>>|r!"
L.Alerts_HallsFab_Conduit_Strike                    = "|cFF0000Golpe conductor|r inminente. ¡Bloquea!"
L.Alerts_HallsFab_Draining_Ballista                 = "¡|cFFC000Balista drenadora|r apuntándote! ¡Bloquea o interrumpe!"
L.Alerts_HallsFab_Draining_Ballista_Other           = "¡|cFFC000Balista drenadora|r apuntando a |cFF0000<<C:1>>|r! ¡Interrumpe!"
L.Alerts_HallsFab_Power_Leech                       = "¡|c6600FFSucción de poder|r! ¡Libérate!"
L.Alerts_HallsFab_Overcharge_Aura                   = "¡|c3366EEAura sobrecargada|r en el Reclamador."
L.Alerts_HallsFab_Overpower_Auras                   = "¡|cFF0000Cuenta regresiva del aura!|r"
L.Alerts_HallsFab_Catastrophic_Discharge            = "¡|cFF0000Descarga catastrófica|r en ti! ¡Bloquea!"
L.Alerts_HallsFab_Fabricant_Spawn                   = "|cFFC000Fabricante averiado aparecido|r."
L.Alerts_HallsFab_Reclaim_Achieve                   = "|cDCD822[Obsolescencia programada]|r - Logro |cFF0000fallido|r."



--------------------------------
----   Asylum Sanctorium    ----
--------------------------------
L.Settings_Asylum_Header                         = "Asylum Sanctorium"
-- Settings
L.Settings_Asylum_Defiling_Blast                 = "San Llothis: Explosión contaminante"
L.Settings_Asylum_Defiling_Blast_TT              = "Te avisa cuando san Llothis te apunta a ti o a otros con su ataque de cono."
L.Settings_Asylum_Soul_Stained_Corruption        = "San Llothis: Corrupción del alma contaminada"
L.Settings_Asylum_Soul_Stained_Corruption_TT     = "Te avisa cuando san Llothis apunte a un jugador con su ataque que debe ser interrumpido."
L.Settings_Asylum_Teleport_Strike                = "San Felms: Golpe de teletransportación"
L.Settings_Asylum_Teleport_Strike_TT             = "Te avisa cuando san Felms se  teletransportará hacia ti."
L.Settings_Asylum_Exhaustive_Charges             = "San Olms: Cargas agotadoras"
L.Settings_Asylum_Exhaustive_Charges_TT          = "Te avisa cuando san Olms está a punto de lanzar su ataque que deja tres grandes círculos de relámpagos."
L.Settings_Asylum_Storm_The_Heavens              = "San Olms: Asalto desde los Cielos"
L.Settings_Asylum_Storm_The_Heavens_TT           = "Te avisa cuando san Olms está a punto de volar y generar una gran cantidad de pequeños círculos de relámpagos."
L.Settings_Asylum_Gusts_Of_Steam                 = "San Olms: Ráfagas de vapor"
L.Settings_Asylum_Gusts_Of_Steam_TT              = "Te avisa cuando san Olms está a punto de saltar de un lado a otro, señalando la siguiente fase de la pelea."
L.Settings_Asylum_Gusts_Of_Steam_Slider          = "       - Porcentaje antes del salto"
L.Settings_Asylum_Gusts_Of_Steam_Slider_TT       = "Muestra una notificación cierto porcentaje antes del necesario para que el jefe ejecute su ataque de saltos."
L.Settings_Asylum_Protector_Spawn                = "San Olms: Aparición de protector"
L.Settings_Asylum_Protector_Spawn_TT             = "Te avisa cuando un protector está por aparecer."
L.Settings_Asylum_Trial_By_Fire                  = "San Olms: Prueba de fuego"
L.Settings_Asylum_Trial_By_Fire_TT               = "Te avisa cuando san Olms está a punto de lanzar fuego en la fase de ejecución."
-- Alerts
L.Alerts_Asylum_Defiling_Blast                   = "¡Peligro! |c00cc00Explosión contaminante|r sobre ti."
L.Alerts_Asylum_Defiling_Blast_Other             = "¡Peligro! |c00cc00Explosión contaminante|r sobre |cFF0000<<C:1>>|r."
L.Alerts_Asylum_Soul_Stained_Corruption          = "|c3366EECorrupción del alma contaminada|r inminente. ¡Interrumpir!"
L.Alerts_Asylum_Teleport_Strike                  = "|cFF3366Golpe de transportación|r sobre ti."
L.Alerts_Asylum_Teleport_Strike_Other            = "|cFF3366 Golpe de transportación|r sobre |cFF0000<<C:1>>|r."
L.Alerts_Asylum_Exhaustive_Charges               = "|cFF0000Cargas agotadoras|r inminente."
L.Alerts_Asylum_Storm_The_Heavens                = "¡|cFF0000Asalto desde los Cielos|r inminente! ¡Aléjate lentamente!"
L.Alerts_Asylum_Gusts_Of_Steam                   = "¡|cFF9900Ráfagas de vapor|r inminente! ¡Escóndete!"
L.Alerts_Asylum_Pre_Gusts_Of_Steam               = "¡|cFF0000<<1>>%|r va a |cFF9900saltar|r! ¡Preparate para esconderte!"
L.Alerts_Asylum_Trial_By_Fire                    = "¡|cFF5500Fuego|r inminente!"
L.Alerts_Asylum_Protector_Spawn                  = "¡|c0000FFProtector|r apareciendo!"
L.Alerts_Asylum_Protector_Active                 = "¡|c0000FFProtector|r activo!"



--------------------------------
------   CLOUDREST         -----
--------------------------------
L.Settings_Cloudrest_Header                     = "Cloudrest / Nubelia"
-- Settings
L.Settings_Cloudrest_Olorime_Spears             = "General: Lanza de Olorime"
L.Settings_Cloudrest_Olorime_Spears_TT          = "Te avisa cuando las lanzas han aparecido y alguien tiene que recogerlas."
L.Settings_Cloudrest_Shadow_Realm_Cast          = "General: Aparición del portal"
L.Settings_Cloudrest_Shadow_Realm_Cast_TT       = "Te avisa cuando un portal al Reino de las Sombras aparece."
L.Settings_Cloudrest_Hoarfrost                  = "Faralielle: Escarcha"
L.Settings_Cloudrest_Hoarfrost_TT               = "Te avisa cuando tengas el efecto negativo Escarcha sobre ti, que requiere que se active una sinergia para liberarte de él."
L.Settings_Cloudrest_Hoarfrost_Countdown        = "       - Usar cuenta regresiva"
L.Settings_Cloudrest_Hoarfrost_Countdown_TT     = "Muestra una cuenta regresiva que te indicará cuando podrás soltarlo."
L.Settings_Cloudrest_Hoarfrost_Shed             = "Faralielle: Escarcha - Liberación"
L.Settings_Cloudrest_Hoarfrost_Shed_TT          = "Te avisa cuando otro jugador se haya liberado del efecto negativo Escarcha y necesite ser recogido."
L.Settings_Cloudrest_Heavy_Attack               = "Mini jefe: Ataque pesado"
L.Settings_Cloudrest_Heavy_Attack_TT            = "Te avisa cuando el mini jefe de relámpago (Golpe electrizante), fuego (Tajo ardiente) o escarcha (Golpe destructor) esté preparando un ataque pesado."
L.Settings_Cloudrest_Chilling_Comet             = "Faralielle: Cometa gélido"
L.Settings_Cloudrest_Chilling_Comet_TT          = "Te avisa cuando el efecto negativo Cometa gélido te sea aplicado y debas bloquearlo sin cruzarte con otro jugador que tenga el mismo efecto negativo antes de la explosión."
L.Settings_Cloudrest_Roaring_Flare              = "Siroria: Llama rugiente"
L.Settings_Cloudrest_Roaring_Flare_TT           = "Te avisa cuando tú o cualquier miembro de tu equipo tenga el efecto negativo Llama rugiente que requiere que al menos 3 miembros del grupo en total se amontonen para anularlo."
L.Settings_Cloudrest_Track_Roaring_Flare        = "       - Seguir Llama rugiente"
L.Settings_Cloudrest_Track_Roaring_Flare_TT     = "Muestra una sutil flecha alrededor de la retícula que apunta hacia el jugador afectado por Llama rugiente."
L.Settings_Cloudrest_Voltaic_Overload           = "Belanaril: Sobrecarga voltaica"
L.Settings_Cloudrest_Voltaic_Overload_TT        = "Te avisa cuando estés a punto de obtener el efecto negativo Sobrecarga voltaica, con el cual, tras afectarte el efecto negativo, no deberás cambiar tu barra de habilidades durante 10 segundos."
L.Settings_Cloudrest_Nocturnals_Favor           = "Z'Maja: Favor de Nocturnal"
L.Settings_Cloudrest_Nocturnals_Favor_TT        = "Te avisa cuando Z'Maja te hace objetivo de su ataque pesado."
L.Settings_Cloudrest_Baneful_Barb               = "Yaghra monstruoso: Espina funesta"
L.Settings_Cloudrest_Baneful_Barb_TT            = "Te avisa cuando una yaghra monstruoso te haya hecho su objetivo antes de ejecutar su ataque Espina funesta."
L.Settings_Cloudrest_Break_Amulet               = "Z'Maja: Sólo mecánicas importantes en fase final"
L.Settings_Cloudrest_Break_Amulet_TT            = "Desactiva notificaciones de esferas y enredaderas en la fase de ejecución."
L.Settings_Cloudrest_Sum_Shadow_Beads           = "Z'Maja: Esferas"
L.Settings_Cloudrest_Sum_Shadow_Beads_TT        = "Te avisa cuando las esferas estén por aparecer."
L.Settings_Cloudrest_Tentacle_Spawn             = "Z'Maja: Aparición de enredaderas"
L.Settings_Cloudrest_Tentacle_Spawn_TT          = "Te avisa cuando las enredaderas de Nocturnal estén por aparecer."
L.Settings_Cloudrest_Crushing_Darkness          = "Z'Maja: Oscuridad aplastante"
L.Settings_Cloudrest_Crushing_Darkness_TT       = "Te avisa cuando el área de efecto del filamento te esté siguiendo y necesite ser alejado."
L.Settings_Cloudrest_Malicious_Strike           = "Z'Maja: Golpe malicioso"
L.Settings_Cloudrest_Malicious_Strike_TT        = "Te avisa cuando las esferas hayan sido destruidas y necesites bloquear o esquivar."

-- Alerts
L.Alerts_Cloudrest_Olorime_Spears               = "¡Han aparecido |cffd000lanzas|r! (<<1>>)"
L.Alerts_Cloudrest_Hoarfrost0                   = "¡|c00ddffEscarcha|r sobre ti!"
L.Alerts_Cloudrest_Hoarfrost1                   = "¡|cff0000Última|r |c00ddffescarcha|r sobre ti!"
L.Alerts_Cloudrest_Hoarfrost_Other0             = "|c00ddffEscarcha|r sobre |cff0000<<!C:1>>|r."
L.Alerts_Cloudrest_Hoarfrost_Other1             = "|cff0000Última|r |c00ddffescarcha|r sobre |cff0000<<!C:1>>|r."
L.Alerts_Cloudrest_Hoarfrost_Countdown0         = "Libérate de la |c00ddffescarcha|r en..."
L.Alerts_Cloudrest_Hoarfrost_Countdown1         = "Libérate de la |cff0000última|r |c00ddffescarcha|r en..."
L.Alerts_Cloudrest_Hoarfrost_Syn                = "¡|cff0000Usa la sinergia|r para liberarte de la escarcha!"
L.Alerts_Cloudrest_Hoarfrost_Shed               = "|c00ddffEscarcha|r liberada."
L.Alerts_Cloudrest_Hoarfrost_Shed_Other         = "|c00ddffEscarcha|r liberada por |cff0000<<!C:1>>|r."
L.Alerts_Cloudrest_Heavy_Attack                 = "¡|c0bf29eAtaque pesado|r sobre ti!"
L.Alerts_Cloudrest_Heavy_Attack_Other           = "¡|c0bf29eAtaque pesado|r sobre |cff0000<<!C:1>>|r!"
L.Alerts_Cloudrest_Baneful_Barb                 = "|cff0000Espina funesta|r. ¡Esquiva!"
L.Alerts_Cloudrest_Baneful_Barb_Other           = "|cff0000Espina funesta|r sobre |cff0000<<!C:1>>|r."
L.Alerts_Cloudrest_Chilling_Comet               = "|cff0000Cometa gélido|r sobre ti. ¡Bloquea!"
L.Alerts_Cloudrest_Roaring_Flare                = "|cff7700Llama rugiente|r sobre ti."
L.Alerts_Cloudrest_Roaring_Flare_2              = "|cff0000<<!C:1>>|r |t100%:100%:Esoui/Art/Buttons/large_leftarrow_up.dds|t |cff7700Llama rugiente|r |t100%:100%:Esoui/Art/Buttons/large_rightarrow_up.dds|t |cff0000<<!C:2>>|r."
L.Alerts_Cloudrest_Roaring_Flare_Other          = "|cff7700Llama rugiente|r sobre |cff0000<<!C:1>>|r. ¡Amontónense!"
L.Alerts_Cloudrest_Voltaic_Current              = "|c55b4d4Sobrecarga voltaica|r inminente sobre ti en:"
L.Alerts_Cloudrest_Voltaic_Overload             = "¡|c4d61c1Sobrecarga voltaica|r sobre ti! ¡Cambia de barra de habilidades!"
L.Alerts_Cloudrest_Voltaic_Overload_Cd          = "|c4d61c1Sobrecarga voltaica|r. ¡No cambies de barra de habilidades!"
L.Alerts_Cloudrest_Shadow_Realm_Cast            = "Aparición del |cab82ffportal|r: (<<1>>)"
L.Alerts_Cloudrest_Tentacle_Spawn               = "|c00a86bEnredaderas|r aparecerán."
L.Alerts_Cloudrest_Sum_Shadow_Beads             = "|cab82ffEsferas|r están a punto de aparecer."
L.Alerts_Cloudrest_Nocturnals_Favor             = "¡|cff0000Favor de Nocturnal|r sobre ti!"
L.Alerts_Cloudrest_Crushing_Darkness            = "|cfc0c66Oscuridad aplastante|r sobre ti. ¡Aléjala del grupo!"
L.Alerts_Cloudrest_Malicious_Strike             = "|cff0000Golpe malicioso|r sobre ti. ¡Bloquea!"

--------------------------------
------   SUNSPIRE          -----
--------------------------------
L.Settings_Sunspire_Header                = "Sunspire / Cúspide del Sol"
-- Settings
L.Settings_Sunspire_Chilling_Comet        = "General: Cometa gélido"
L.Settings_Sunspire_Chilling_Comet_TT     = "Te avisa cuando un cometa gélido se dirige hacia ti. Aléjate del grupo, bloquea y no te cruces con otro jugador que también sea objetivo de un cometa gélido. Este ataque tomará como objetivo a dos jugadores a la vez."
L.Settings_Sunspire_Sweeping_Breath       = "Nahviintaas: Barrido de fuego"
L.Settings_Sunspire_Sweeping_Breath_TT    = "Te avisa del aliento de fuego de Nahviintas. El ataque comienza desde un lado de la arena cruzando hasta el otro extremo, hiriendo a todos los jugadores dentro del área. Los jugadores deberán bloquear o esquivar este ataque."
L.Settings_Sunspire_Molten_Meteor         = "Nahviintaas: Meteoro fundido"
L.Settings_Sunspire_Molten_Meteor_TT      = "Te avisa cuando un meteoro fundido se dirige hacia ti. Muévete al borde de la arena, bloquea y no te cruces con otro jugador que también sea objetivo de un meteoro fundido. Este ataque tomará como objetivo a tres jugadores a la vez."
L.Settings_Sunspire_Focus_Fire            = "Yolnahkriin: Fuego centrado"
L.Settings_Sunspire_Focus_Fire_TT         = "Te avisa cuando un miembro del grupo es objetivo del fuego centrado. Este ataque requiere que los miembros del grupo se amontonen para disipar el daño. Habrá un efecto negativo persistente tras el ataque, que incrementa el daño recibido del próximo fuego centrado. Debido a este efecto, los jugadores deberían amontonarse en dos grupos separados."
L.Settings_Sunspire_Breath                = "General: Aliento de fuego/de escarcha/abrasador"
L.Settings_Sunspire_Breath_TT             = "Te avisa cuando el ataque de cono canalizado está sobre ti, causándote grandes daños."
L.Settings_Sunspire_Cataclism             = "Yolnahkriin: Cataclismo"
L.Settings_Sunspire_Cataclism_TT          = "Te avisa cuando el jefe usará su aliento de fuego en el medio de la arena. Todos deberán moverse al borde de la arena y matar a los enemigos adicionales."
L.Settings_Sunspire_Frozen_Tomb           = "Lokkestiiz: Tumba de hielo"
L.Settings_Sunspire_Frozen_Tomb_TT        = "Te avisa cuando aparece una tumba de hielo. Un jugador deberá caminar hacia la tumba, la cual lo congelará y causará daño persistente. Tendrás que ser curado para liberarte. Requiere que tres jugadores distintos caminen hacia la tumba, uno a la vez, debido a un efecto negativo."
L.Settings_Sunspire_Thrash                = "Nahviintaas: Azote"
L.Settings_Sunspire_Thrash_TT             = "Te avisa cuando el jefe está apunto de golpear al grupo con su cabeza, derribándolos a todos. Este ataque debe ser esquivado o bloqueado."
L.Settings_Sunspire_Mark_For_Death        = "Nahviintaas: Marca de la muerte"
L.Settings_Sunspire_Mark_For_Death_TT     = "Te avisa cuando tienes una marca de la muerte, que causa gran daño persistente y elimina por completo todas tus resistencias."
L.Settings_Sunspire_Time_Breach           = "Nahviintaas: Brecha temporal"
L.Settings_Sunspire_Time_Breach_TT        = "Te avisa cuando un portal para el cambio temporal se ha abierto."
L.Settings_Sunspire_Negate_Field          = "Siervo eterno: Campo de anulación"
L.Settings_Sunspire_Negate_Field_TT       = "Muestra una advertencia si el campo de anulación te está afectando desde el cambio temporal."
L.Settings_Sunspire_Shock_Bolt            = "Siervo eterno: Proyectil eléctrico"
L.Settings_Sunspire_Shock_Bolt_TT         = "Muestra una cuenta regresiva que informa cuándo el grupo deberá amontonarse para desprender a otro jugador."
L.Settings_Sunspire_Apocalypse            = "Siervo eterno: Apocalipsis transitorio"
L.Settings_Sunspire_Apocalypse_TT         = "Te avisa cuando un siervo eterno está canalizando su ataque al grupo del plano superior. Te muestra una cuenta regresiva hasta que puedas interrumpir la canalización y otra hasta que termine de canalizar el ataque."


-- Alerts
L.Alerts_Sunspire_Chilling_Comet          = "|c00ddffCometa gélido|r sobre ti. ¡Bloquea!"
L.Alerts_Sunspire_Chilling_Comet_Other    = "|c00ddffCometa gélido|r sobre |cff0000<<!C:1>>|r."
L.Alerts_Sunspire_Sweeping_Breath         = "¡|cff0000Barrido de fuego|r! ¡Bloquea o evítalo!"
L.Alerts_Sunspire_Molten_Meteor           = "¡|c00ddffMeteoro fundido|r sobre ti! ¡Aléjate del grupo!"
L.Alerts_Sunspire_Molten_Meteor_Other     = "|c00ddffMeteoro fundido|r sobre <<!C:1>>|r."
L.Alerts_Sunspire_Focus_Fire              = "|cff7700Fuego centrado|r sobre ti en:"
L.Alerts_Sunspire_Focus_Fire_Other        = "|cff7700Fuego centrado|r sobre |cff0000<<!C:1>>|r en:"
L.Alerts_Sunspire_Atronach_Zap            = "|cff7700Atronachs|r apareciendo en"
L.Alerts_Sunspire_Frost_Atronach          = "¡|cff7700Atronachs de la escarcha|r han aparecido!"
L.Alerts_Sunspire_Breath                  = "¡|cffff00<<1>>|r sobre ti!"
L.Alerts_Sunspire_Breath_Other            = "|cffff00<<1>>|r sobre |cff0000<<!C:2>>|r."
L.Alerts_Sunspire_Cataclism               = "|cff3300Cataclismo|r terminará en:"
L.Alerts_Sunspire_Frozen_Tomb             = "|c00ddffTumba de hielo|r: (<<1>>)"
L.Alerts_Sunspire_Thrash                  = "¡|cff0000Azote|r inminente! ¡Bloquea!"
L.Alerts_Sunspire_Mark_For_Death          = "Marca de la muerte sobre ti."
L.Alerts_Sunspire_Mark_For_Death_Other    = "Marca de la muerte sobre |cff0000<<!C:1>>|r."
L.Alerts_Sunspire_Time_Breach_Countdown   = "|c81cc00Brecha temporal|r en:"
L.Alerts_Sunspire_Negate_Field            = "¡|c53c4c9Campo de anulación|r sobre ti!"
L.Alerts_Sunspire_Negate_Field_Others     = "¡|c53c4c9Campo de anulación|r sobre <<!C:1>>!"
L.Alerts_Sunspire_Shock_Bolt              = "¡|c00ddffProyectil eléctrico|r inminente! ¡Amontónense para desprenderlo!"
L.Alerts_Sunspire_Apocalypse              = "|cffff00Apocalipsis transitorio|r inminente! Interrúmpelo."
L.Alerts_Sunspire_Apocalypse_Ends         = "|cffff00Apocalipsis transitorio|r terminará en:"


--------------------------------
------   KYNE'S AEGIS      -----
--------------------------------
L.Settings_KynesAegis_Header                        = "Kyne's Aegis / Égida de Kyne"
-- Settings
L.Settings_KynesAegis_Crashing_Wall                 = "General: Ola aplastante"
L.Settings_KynesAegis_Crashing_Wall_TT              = "Te avisa cuando un rompeolas semigigante comienza su ataque Ola aplastante, contando hasta que es desatado. Bloquéalo o esquívalo."
L.Settings_KynesAegis_Sanguine_Prison               = "General: Prisión sanguínea"
L.Settings_KynesAegis_Sanguine_Prison_TT            = "Te avisa cuando un aliado sea atrapado en una Prisión sanguínea invocada por un caballero acre. Deberás liberar a tu aliado concentrándote en su prisión."
L.Settings_KynesAegis_Blood_Fountain                = "General: Fuente de sangre"
L.Settings_KynesAegis_Blood_Fountain_TT             = "Te avisa cuando un caballero sanguinario comienza su ataque Fuente de sangre, contando hasta que es desatado. Es un ataque de área con forma de cruz, y debe ser esquivado, puesto que causa gran cantidad de daño."
L.Settings_KynesAegis_Totem                         = "Yandir: Aparición de tótems"
L.Settings_KynesAegis_Totem_TT                      = "Te avisa cuando ciertos tótems aparecen durante la batalla contra Yandir el Matarife.\n\nTótems de dragón: siempre aparecen dos a la vez; cada uno escupe fuego en una línea recta en dos direcciones opuestas.\nTótem de arpía: invoca un aura de relámpago que irradiará.\nTótem de gárgola: convierte jugadores aleatorios en piedra.\nTótem de cauro: envenena varios jugadores, y este veneno no debe ser esparcido a los demás, por lo que es mejor no amontonarse durante esta fase."

-- Alerts
L.Alerts_KynesAegis_Crashing_Wall                   = "|cd2a100Ola aplastante|r en"
L.Alerts_KynesAegis_Sanguine_Prison_Other           = "|cff0000<<!aC:1>>|r está atrapado en una |cb00000Prisión sanguínea|r. ¡Libérenlo!"
L.Alerts_KynesAegis_Blood_Fountain                  = "|cb00000Fuente de sangre|r en"
L.Alerts_KynesAegis_Dragon_Totem                    = "Dos |cffa500tótems de dragón|r colocados. ¡Esquiven el fuego!"
L.Alerts_KynesAegis_Harpy_Totem                     = "|c00bfffTótem de arpía|r colocado."
L.Alerts_KynesAegis_Gargoyle_Totem                  = "|cf5f5dcTótem de gárgola|r colocado."
L.Alerts_KynesAegis_Chaurus_Totem                   = "|c39942eTótem de cauro|r colocado. ¡No se amontonen!"


--------------------------------
----       Debugging        ----
--------------------------------
L.Settings_Debug_Header                  = "Depuración"
L.Settings_Debug                         = "Activar modo depuración"
L.Settings_Debug_TT                      = "Muestra mensajes de depuración en la ventana de chat"
L.Settings_Debug_DevMode                 = "Modo desarrollador"
L.Settings_Debug_DevMode_TT              = "Cuando esto está activado, activa ciertos avisos que podrían no estar funcionando correctamente, tener tiempos desacordes o que no han sido probados en su totalidad. En general no deberían producir ningún error de interfaz, pero se recomiende al uso de un addon 'error catcher'."
L.Settings_Debug_DevMode_Warning         = "Requiere Modo desarrollador"

L.Settings_Debug_Tracker_Header          = "Tracker de depuración"
L.Settings_Debug_Tracker_Description     = "Esta es una característica de depuración cuyo fin es rastrear y mostrar las mecánicas potenciales durante el curso de una prueba mostrando información de los eventos y efectos en el combate. Debido a la potencialmente enorme entrada de información, cuentas con algunas opciones para ayudarte a evitar inundar la ventana de chat."
L.Settings_Debug_Tracker_Enabled         = "Activado"
L.Settings_Debug_Tracker_SpamControl     = "Control de spam"
L.Settings_Debug_Tracker_SpamControl_TT  = "Con esto, cada habilidad/efecto aparecerá sólo una vez según su tipo de acción. La lista de habilidades conocidas en esta sesión puede ser limpiada con el comando \"/rndebug clear\"."
L.Settings_Debug_Tracker_MyEnemyOnly     = "Sólo de mi enemigo"
L.Settings_Debug_Tracker_MyEnemyOnly_TT  = "Cuando esté activado, limitará la aparición a habilidades/efectos dirigidos al jugador y NO los que salen del jugador o de algún miembro del grupo. Útil para cuando estés buscando una acción en específico y no quieras activar el control de spam."



--TODO: get rid of this ugly, bulky localization method
for k, v in pairs(L) do
    local string = "RAIDNOTIFIER_" .. string.upper(k)
    ZO_CreateStringId(string, v)
end

if (GetCVar('language.2') == 'es') then
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
