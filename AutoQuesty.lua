local autoquestyFrame  = CreateFrame("Frame")
local autoquestyLoaded = 0
local currentMapId  = 0

addonMap            = {}
currentLoadedPlugin = nil

--
-- This function is called whenever a registered event occurs
--
-- @param self      The frame through which the event occurred
-- @param event     A string containing the name of the event that occurred
-- @param addonName A string containing the name of the addon to which this
--                  event pertains.
--
local function frameEvent(self, event, addonName, ...)
    if (addonName == "AutoQuesty") then
        autoquestyLoaded = 1
        SLASH_AQT1 = '/aqt'

        print("AutoQuesty loaded :)")
    end

    if (IsAltKeyDown()) then
        if (autoquestyLoaded == 1 and event == "QUEST_GREETING") then
            print("QUEST_GREETING")
        elseif (autoquestyLoaded == 1 and event == "QUEST_PROGRESS") then
            print("QUEST_PROGRESS")
        elseif (autoquestyLoaded == 1 and event == "QUEST_COMPLETE") then
            print("QUEST_COMPLETE")
            CompleteQuest()
        elseif (autoquestyLoaded == 1 and event == "QUEST_DETAIL") then
            print("QUEST_DETAIL")
            AcceptQuest()
        elseif (autoquestyLoaded == 1 and event == "QUEST_FINISHED") then
            print("QUEST_FINISHED")
        elseif (autoquestyLoaded == 1 and event == "GOSSIP_SHOW") then
            print("GOSSIP_SHOW")
            numNewQuests = GetNumGossipAvailableQuests()
            print("Number of quests: " .. numNewQuests)
            SelectGossipAvailableQuest(numNewQuests)
        end
    end
end

-- GetGossipActiveQuests
-- GetGossipAvailableQuests
-- GetNumQuest*
-- GetQuest*



autoquestyFrame:RegisterEvent("QUEST_GREETING")
autoquestyFrame:RegisterEvent("QUEST_DETAIL")
autoquestyFrame:RegisterEvent("QUEST_PROGRESS")
autoquestyFrame:RegisterEvent("QUEST_FINISHED")
autoquestyFrame:RegisterEvent("QUEST_COMPLETE")
autoquestyFrame:RegisterEvent("GOSSIP_SHOW")
autoquestyFrame:RegisterEvent("ADDON_LOADED")
autoquestyFrame:SetScript("OnEvent", frameEvent)

--
-- This function processes any slash command that is registered
--
-- @param msg     A string containing any text that was present after the
--                slash command
-- @param editbox I have literally no idea
--
function SlashCmdList.AQT(msg, editbox)
    if msg == '?' then
        print("AutoQuesty");
        print("Usage: Not implemented");
    end
end
