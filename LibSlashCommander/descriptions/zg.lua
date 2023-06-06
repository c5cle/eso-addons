LibSlashCommander:AddFile("descriptions/zg.lua", 2, function(lib)
    local descriptions = {
        [GetString(SI_SLASH_SCRIPT)] = "将指定的文本作为Lua代码执行",
        [GetString(SI_SLASH_CHATLOG)] = "打开或关闭聊天框日志",
        [GetString(SI_SLASH_GROUP_INVITE)] = "将指定的名称邀请到队伍",
        [GetString(SI_SLASH_JUMP_TO_LEADER)] = "传送到队长",
        [GetString(SI_SLASH_JUMP_TO_GROUP_MEMBER)] = "传送到指定队伍成员",
        [GetString(SI_SLASH_JUMP_TO_FRIEND)] = "传送到指定好友",
        [GetString(SI_SLASH_JUMP_TO_GUILD_MEMBER)] = "传送到指定公会成员",
        [GetString(SI_SLASH_RELOADUI)] = "重新载入界面",
        [GetString(SI_SLASH_PLAYED_TIME)] = "显示此角色已玩时间",
        [GetString(SI_SLASH_READY_CHECK)] = "组队时发起一个就绪检查",
        [GetString(SI_SLASH_DUEL_INVITE)] = "向指定的玩家发起决斗",
        [GetString(SI_SLASH_LOGOUT)] = "返回角色选择界面",
        [GetString(SI_SLASH_CAMP)] = "返回角色选择界面",
        [GetString(SI_SLASH_QUIT)] = "关闭游戏",
        [GetString(SI_SLASH_FPS)] = "切换是否显示FPS",
        [GetString(SI_SLASH_LATENCY)] = "切换是否显示延迟",
        [GetString(SI_SLASH_STUCK)] = "打开帮助界面以解决人物卡死",
        [GetString(SI_SLASH_REPORT_BUG)] = "打开错误报告界面",
        [GetString(SI_SLASH_REPORT_FEEDBACK)] = "打开反馈报告界面",
        [GetString(SI_SLASH_REPORT_HELP)] = "打开帮助界面",
        [GetString(SI_SLASH_REPORT_CHAT)] = "打开举报玩家界面",
        [GetString(SI_SLASH_ENCOUNTER_LOG)] = "切出日志. '?' 显示选项",
    }
    ZO_ShallowTableCopy(descriptions, lib.descriptions)
end)
