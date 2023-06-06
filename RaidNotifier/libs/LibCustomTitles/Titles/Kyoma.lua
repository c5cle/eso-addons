local MY_MODULE_NAME = "Kyoma"
local MY_MODULE_VERSION = 10

local LCC = LibStub('LibCustomTitlesRN')
if not LCC then return end

local MY_MODULE = LCC:RegisterModule(MY_MODULE_NAME, MY_MODULE_VERSION)
if not MY_MODULE then return end

--                      Account           Character  Override    English                                German                                  French                                        Extra (e.g. color, hidden)
MY_MODULE:RegisterTitle("@Kyoma",           nil,       494,     {en = "Master Hoarder",                 de = "Meisterhamsterer"                                                         })
MY_MODULE:RegisterTitle("@Kyoma",           nil,       111,     {en = "Resto-in-Disguise"                                                                                               },    {color="#FF5FF5"})
MY_MODULE:RegisterTitle("@Kyoma",           nil,       112,     {en = "Restolord"                                                                                                       },    {color="#FF5FF5"})
MY_MODULE:RegisterTitle("@Kyoma",           nil,       113,     {en = "Grand Restolord"                                                                                                 },    {color="#FF5FF5"})
MY_MODULE:RegisterTitle("@Kyoma",           nil,       114,     {en = "Restoverlord"                                                                                                    },    {color="#FF5FF5"})
MY_MODULE:RegisterTitle("@Kyoma",           nil,       705,     {en = "Grand Restoverlord"                                                                                              },    {color="#FF5FF5"})
MY_MODULE:RegisterTitle("@Stillian",        nil,      1391,     {en = "Fiery Soul"                                                                                                      })
MY_MODULE:RegisterTitle("@Zantaria",        nil,       627,     {en = "Exploiter"                                                                                                       })
MY_MODULE:RegisterTitle("@KisoValley",      nil,        92,     {en = "Decent"                                                                                                          })
MY_MODULE:RegisterTitle("@SloppyChef",      nil,     false,     {en = "Grote Vriendelijke Reus"                                                                                         })
MY_MODULE:RegisterTitle("@sp_korshun",      nil,      1444,     {en = "Achievement Hunter"                                                                                              })
MY_MODULE:RegisterTitle("@MMasing",         nil,        92,     {en = "Queen of Healing"                                                                                                },    {color={"#2DCAED", "#EFC509"}})
MY_MODULE:RegisterTitle("@DerpyShadowz",    nil,      1921,     {en = "Useless Nightblade"                                                                                              },    {color={"#ED1515", "#FF45FF"}})
MY_MODULE:RegisterTitle("@DerpyShadowz",    nil,      1391,     {en = "The Silly Salmon"                                                                                                },    {color={"#ED1515", "#FF45FF"}})
MY_MODULE:RegisterTitle("@DerpyShadowz",    "Dreams of Dragons Fire",      
                                                      1391,     {en = "A World In Ruin",                                                                                                },    {color={"#ED1515", "#F5C514"}})
MY_MODULE:RegisterTitle("@iJonno",          nil,      1730,     {en = "Princess",                       de = "Prinzessin",                      fr = "Princesse"                        },    {color="#FAABFF"})
MY_MODULE:RegisterTitle("@iJonno",          nil,      1503,     {en = "Princess",                       de = "Prinzessin",                      fr = "Princesse"                        },    {color="#FAABFF"})
MY_MODULE:RegisterTitle("@iiJonno",         nil,      1730,     {en = "Princess",                       de = "Prinzessin",                      fr = "Princesse"                        },    {color="#FAABFF"})
MY_MODULE:RegisterTitle("@iiJonno",         nil,      1503,     {en = "Princess",                       de = "Prinzessin",                      fr = "Princesse"                        },    {color="#FAABFF"})
MY_MODULE:RegisterTitle("@Floliroy",        nil,      1391,     {en = "Leeeeroy Jeeeeenkins"                                                                                            },    {color={"#0131B4", "#ED1600"}})
MY_MODULE:RegisterTitle("@Floliroy",        nil,      1810,     {en = "Leeeeroy Jeeeeenkins"                                                                                            },    {color={"#FE2008", "#F9E259"}})
MY_MODULE:RegisterTitle("@Floliroy",        nil,      1330,     {en = "Leeeeroy Jeeeeenkins"                                                                                            },    {color={"#EFC509", "#2DCAED"}})
MY_MODULE:RegisterTitle("@secunder7",       nil,       702,     {en = "Heart of Magician",              de = "Ich bin ein Zauberer",            fr = "Cœur de Magicien"                 })
MY_MODULE:RegisterTitle("@Napoleoff",       nil,      1391,     {en = "Malzahar"                                                                                                        },    {color="#A825F8"})
MY_MODULE:RegisterTitle("@Trinet",          nil,        92,     {en = "Señor Chile"                                                                                                     },    {color={"#0000FF", "#FF0000"}})
MY_MODULE:RegisterTitle("@gaimers",         nil,     false,     {en = "What do you |c990000meme|r?"                                                                                     })
MY_MODULE:RegisterTitle("@Karma'X",         nil,      true,     {en = "Karma's a Bitch"                                                                                                 },    {color={"#33CCFF","#66FF33"}})
