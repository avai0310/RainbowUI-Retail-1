---@class CraftSim
local CraftSim = select(2, ...)

local GUTIL = CraftSim.GUTIL

CraftSim.NEWS = {}

local print = CraftSim.DEBUG:SetDebugPrint(CraftSim.CONST.DEBUG_IDS.NEWS)

---@param itemMap table<string, ItemMixin>
function CraftSim.NEWS:GET_NEWS(itemMap)
    -- minimize names to make manual formatting easier :p
    local f = GUTIL:GetFormatter()
    local function newP(v) return f.l("\n                                   --- Version " .. v .. " ---\n") end
    local supporterListUpdate = f.p .. f.patreon("Supporter List Update ") ..
        CraftSim.MEDIA:GetAsTextIcon(CraftSim.MEDIA.IMAGES.PIXEL_HEART, 0.15)
    local news = {
        f.bb("                   Hello and thank you for using CraftSim!\n"),
        f.bb("                                 ( You are awesome! )"),
        newP("19.2.0"),
        f.p .. "Restock Favorites Feature added",
        f.a .. f.bb("Experimental") .. " - More Options will come soon", 
        newP("19.1.0"),
        f.p .. "11.0.5 Updates",
        newP("19.0.1"),
        f.p .. f.bb("Concentration Tracker"),
        f.a .. "- Fixed sometimes not updating cached concentration amount",
        newP("19.0.0"),
        f.P .. "Introducing " .. f.bb("Finishing Reagent") .. " Optimization",
        f.a .. "- Available in most Optimization Options",
        f.P .. f.gold("Concentration Value"),
        f.a .. "- Is now considering the average concentration costs of a craft",
        f.a .. "  considering " .. f.bb("Ingenuity"),
        f.a .. "- Is now used as the main comparison point between",
        f.a .. "  gear, qualities and more when concentration",
        f.a .. "  is toggled on",
        f.s .. f.bb("+ CraftQueue") .. " button can now be shift clicked",
        f.a .. "- This will ignore any optimizations and queue the recipe as is",
        f.p .. "Major internal code improvements for optimization processes",
        newP("18.3.1"),
        f.p .. "Fixed 'Submittable' queued patron orders not",
        f.a .. "  being on top of queue",
        newP("18.3.0"),
        f.s .. f.bb("CraftQueue Patron Orders"),
        f.a .. "- Added a temporary option to ignore warbank reagents",
        f.a .. " as a workaround to the warbank issue until 11.0.5",
        f.a .. "- Changed 'Ignore' Options to 'Include' options",
        f.a .. " and added augment rune and acuity",
        newP("18.2.9"),
        f.P .. f.bb("Recipe Scan"),
        f.a .. "- Concentration Optimization now frame distributed",
        f.a .. "- Added progress percentage for optimization of current recipe",
        f.p .. f.gold("Concentration Optimization"),
        f.a .. "- Increased calculations from 1 to 2 per frame",
        f.p .. f.bb("CraftQueue"),
        f.a .. "- Slightly moved the + CraftQueue button to not overlap",
        f.a .. "  with PSL buttons.",
        f.a .. "- Added options button beside + CraftQueue button",
        f.p .. "Locals Update",
        f.a .. "- " .. f.bb("ptBR") .. " by: " .. f.bb("https://github.com/cconolly"),
        newP("18.2.8"),
        f.p .. "Added a " .. f.r("Force ") .. f.gold("Concentration") .. " option for queuing patron orders",
        newP("18.2.7"),
        f.s .. f.bb("Craft Queue - Edit Recipe"),
        f.a .. "Fixed and reworked the " .. f.gold("Optimize") .. " Button",
        newP("18.2.6"),
        f.s .. "Testing new MenuUtil Context Menu and more",
        f.s .. f.g("Queue Patron Orders") .. " Options added",
        f.a .. "- Ignore " .. f.e("Spark") .. " Recipes",
        f.a .. "- " .. f.bb("Knowledge Point Rewards") .. " only",
        newP("18.2.5"),
        f.s .. "Filter Buttons now use the new Menu Style",
        f.p .. "Fixed some button interactions",
        newP("18.2.4"),
        f.P .. f.bb("CraftQueue"),
        f.a .. "- Moved queue button for open recipe to recipe view",
        f.a .. "- Enabled more" .. f.g(" Queuing Options") .. " on right click",
        f.P .. f.l("RecipeData Class - API Changes"),
        f.a .. "- See " .. f.bb("API_README.md"),
        f.p .. "Specialization Talent Data Updated",
        f.p .. "Fixed " .. f.bb("CraftQueue") .. " consistency when reloading after login",
        f.p .. "Locals Update",
        f.a .. "- " .. f.bb("deDE") .. " by: " .. f.bb("https://github.com/Gogadon"),
        newP("18.2.3"),
        f.P ..
        "Added a " ..
        f.r("Warning Icon") .. " in " .. f.bb("Average Profit") .. " for " .. f.l("Price Overrides"),
        f.p .. f.bb("Top Profit Reagent Optimization"),
        f.a .. "- Fixed not choosing highest profit quality",
        f.p .. f.bb("Recipe Scan"),
        f.a .. "- Fixed max quality recipe profit when concentrating",
        newP("18.2.2"),
        f.s .. f.g("Material Optimization") .. " renamed to " .. f.bb("Reagent Optimization"),
        f.p .. "Rewrote some optimizations to be frame distributed",
        f.p .. "Fixed " .. f.bb("Craft Queue") .. " Shopping List optional reagent quality bug",
        newP("18.2.1"),
        f.P .. f.g("Reagent Optimization"),
        f.a .. "- Added " .. f.bb("Top Profit") .. " Option",
        f.a .. "- Optimizes for most profitable quality",
        f.P .. f.g("Recipe Scan"),
        f.a .. "- Added Option to use Top Profit Reagent Optimization",
        f.a .. "- Added Option to Optimize Concentration Value",
        f.a .. "- Now does not show Concentration Cost or Value if",
        f.a .. "Concentration is disabled",
        newP("18.2.0"),
        f.P .. f.g("Concentration Tracker Overhaul"),
        f.a .. "- Made Tracker Frame pinnable",
        f.a .. "- Added " .. f.g("Right Click Context Menu") .. " with " .. f.g("Blacklist") .. " Option",
        f.a .. "- Added " .. f.g("Sort Mode") .. " Option",
        f.a .. "- Added " .. f.g("Format") .. " Option",
        f.P .. "Added " .. f.g("TSM Restock Expression") .. " in TSM Options",
        f.a .. "- Contributed by: " .. f.bb("https://github.com/netouss"),
        f.a .. "- If enabled, replaces configured general restock amount",
        f.p .. "Locals Update",
        f.a .. "- Contributed by: " .. f.bb("https://github.com/LvWind"),
        f.a .. "- Contributed by: " .. f.bb("https://github.com/Gogadon"),
        f.p .. "Hotfix #1",
        f.a .. "Fixed patron order concentration usage identification",
        newP("18.1.1"),
        f.P .. f.bb("Patron Work Orders"),
        f.a .. "- Now consider reward items' prices in average profit calculation",
        newP("18.1.0"),
        f.P .. "Added a first draft of a " .. f.gold("Concentration Optimization"),
        f.a .. "- You can find the button in the " .. f.bb("Reagent Optimization") .. " Module",
        f.p .. "Based on user feedback the " .. f.bb("Concentration Value"),
        f.a .. "is now calculated using only profit instead of profit difference",
        newP("18.0.5"),
        f.p .. "Fixed " .. f.bb("Reagent Optimization - ") .. f.g("Allocate Button"),
        newP("18.0.4"),
        f.P .. "New " .. f.g("Reagent Optimization ") .. "Features",
        f.a .. "- It is now possible to choose a maximum quality to optimize for",
        f.a .. "- Overhauled the " .. f.bb("Reagent Optimization UI"),
        f.P .. f.g("Client Reagents") .. " are now considered in work orders",
        f.P .. f.g("Craft Queue Patron Order Queueing") .. " now optimizes for",
        f.a .. "given minimum quality while considering supplied reagents",
        f.a .. "- Added an option to use concentration if work order",
        f.a .. "cannot be reached without",
        f.a .. "when optimizing reagents",
        f.p .. f.bb("Specialization Data") .. " Update for " .. f.l("11.0.2.56647"),
        newP("18.0.3"),
        f.p .. "Adjusted" .. f.bb(" Multicraft Constant") .. " independently per yield",
        f.a .. "- More data still needed, defaults to 2.5",
        f.a .. "- Option to override temporarly disabled",
        f.p .. "Fixed " .. f.bb("Craft Queue") .. " Craft Button crafting too much",
        newP("18.0.1"),
        f.p .. "Fixed " .. f.bb("Craft Queue") .. " not crafting when craftmax < queued",
        f.p .. "Fixed " .. f.bb("Craft Queue") .. " tab usage error in input box",
        f.p .. "Fixed " .. f.bb("Recipe Scan") .. " not updating concentration box",
        f.p .. "Updated Chinese Locals",
        f.a .. "Thanks to: " .. f.bb("https://github.com/LvWind"),
        newP("18.0.0"),
        f.P .. "The " .. f.g("CraftQueue") .. " now supports " .. f.bb("Work Orders"),
        f.a .. "- Available Patron Orders can now be queued with one click",
        f.a .. "- Work Orders can now be claimed, crafted and",
        f.a .. " submitted in the " .. f.bb("Craft Queue"),
        f.a .. "- " .. f.r("!!") .. " All reagents still need to be in your inventory",
        f.p .. "Changed the wording and setup of all supporter urls",
        f.a .. "and info in the addon",
        newP("17.3.3"),
        f.P .. "Fixed " .. f.bb("PvP Reagents") .. " not being considered in",
        f.a .. "- " .. f.bb("Simulation Mode"),
        f.a .. "- " .. f.bb("Craft Queue (Shopping List)"),
        f.a .. "- " .. f.bb("Recipe Scan"),
        f.s .. "Updated German Locals",
        f.a .. "Thanks to: " .. f.bb("https://github.com/Gogadon"),
        f.s .. "Updated French Locals",
        f.a .. "Thanks to: " .. f.bb("https://github.com/netouss"),
        f.p .. "Fixed " .. f.bb("Blacksmithing") .. " Recipe Scan for alts error",
        f.p .. "Fixed " .. f.bb("Blacksmithing") .. " Queue Cache for alts error",
        f.p .. "Fixed " .. f.bb("Enchanting") .. " Specialization Info Display Error",
        f.p .. "Fixed " .. f.bb("Concentration Tracker") .. " listing Gathering Professions",
        f.p .. "Fixed " .. f.bb("CraftQueue") .. " craft recognition",
        f.p .. "Fixed " .. f.bb("Price Override") .. " Clear All Button",
        supporterListUpdate,
        newP("17.3.2"),
        f.p .. "Specialization Talent Data Updated",
        newP("17.3.1"),
        f.p .. "Fixed " .. f.bb("CraftQueue Restock Profit Threshold"),
        newP("17.3.0"),
        f.P .. f.bb("Recipe Scan") .. ": " .. f.g("New Feature"),
        f.a ..
        "Press " ..
        CreateAtlasMarkup("NPE_LeftClick", 20, 20, 2) .. " + shift to queue recipe into " .. f.bb("Craft Queue"),
        f.s .. "Updated " .. f.bb("Specialization Data"),
        f.s .. f.bb("CraftQueue ") .. "should now support " .. f.e("Spark Reagents"),
        f.p .. itemMap.enchantingRod:GetItemLink() .. " Concentration Bonus now considered",
        newP("17.2.3"),
        f.p .. "Concentration Tracker character name column adaption",
        newP("17.2.2"),
        f.p .. f.l("ForgeFinder Export") .. " now exports both DF and TWW",
        newP("17.2.0"),
        f.P .. "Added an" .. f.l(" easycraft.io") .. " export",
        f.p .. "Fixed " .. f.bb("Skill Gain Finishing Reagents") .. " adding",
        f.a .. "difficulty instead of skill",
        f.p .. "Updated " .. f.bb("Optional Reagents Data"),
        newP("17.1.11"),
        f.P .. "Added an option to toggle " .. f.bb("Money String Format"),
        f.P .. "Addon options should now correctly open via button",
        f.p .. "Updated zhCN Locals",
        f.a .. "- Thank you " .. f.bb("https://github.com/LvWind"), supporterListUpdate,
        newP("17.1.10"),
        f.p .. f.bb("Concentration Tracker") .. " Tooltip now only lists",
        f.a .. "tracked professions from currently open expansion",
        f.p .. f.bb("Specialization Data Update") .. " for 11.0.2.56313",
        f.p .. "Changed general money format from",
        f.a ..
        GUTIL:FormatMoney(12345678, false, nil, false, true) .. " to " .. GUTIL:FormatMoney(12345678),
    }
    return table.concat(news, "\n")
end

---@param newsText string
function CraftSim.NEWS:GetChecksum(newsText)
    local checksum = 0
    local checkSumBitSize = 256

    -- replace each itemLink with a generic string so there are no differences between characters in the checksum
    -- for _, item in pairs(itemMap) do
    -- end
    newsText = string.gsub(newsText, "|cff%x+|Hitem:.+|h|r", "[LINK]")

    -- Iterate through each character in the string
    for i = 1, #newsText do
        checksum = (checksum + string.byte(newsText, i)) % checkSumBitSize
    end

    -- print("replacing links in newstext:")
    -- print(newsText)

    return checksum
end

---@param newsText string
---@return string | nil newChecksum newChecksum when news should be shown, otherwise nil
function CraftSim.NEWS:IsNewsUpdate(newsText)
    local newChecksum = CraftSim.NEWS:GetChecksum(newsText)
    local oldChecksum = CraftSim.DB.OPTIONS:Get("NEWS_CHECKSUM")
    if newChecksum ~= oldChecksum then
        return newChecksum
    end
    return nil
end

---@param force boolean wether to skip the checksum verification
---@async
function CraftSim.NEWS:ShowNews(force)
    local itemMap = {
        enchantingRod = Item:CreateFromItemID(224116),
    }
    CraftSim.GUTIL:ContinueOnAllItemsLoaded(CraftSim.GUTIL:Map(itemMap, function(i) return i end), function()
        local newsText = CraftSim.NEWS:GET_NEWS(itemMap)
        local newChecksum = CraftSim.NEWS:IsNewsUpdate(newsText)
        if newChecksum == nil and (not force) then
            return
        end

        CraftSim.DB.OPTIONS:Save("NEWS_CHECKSUM", newChecksum)

        local infoFrame = CraftSim.GGUI:GetFrame(CraftSim.INIT.FRAMES, CraftSim.CONST.FRAMES.INFO)
        -- resize
        infoFrame:SetSize(CraftSim.CONST.infoBoxSizeX, CraftSim.CONST.infoBoxSizeY)
        infoFrame.originalX = CraftSim.CONST.infoBoxSizeX
        infoFrame.originalY = CraftSim.CONST.infoBoxSizeY
        infoFrame.showInfo(newsText)
    end)
end
