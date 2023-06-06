-- LibMotif: Provide data about motifs that the ESO API does not.
--
-- Originally broken out from WritWorthy to hold motif knowledge
-- achievement_id numbers.
--
-- Gutted and turned into an adapter for code65536's LibCharacterKnowledge
-- once ESO 7.3.0 introduced Account-wide Achievements, which made LibMotif's
-- original use of the achievement API obsolete.
--
-- You really should just use LibCharacterKnowledge directly now.
-- LibMotif no longer adds any value.
--
-- LibMotif intentionally does NOT register for
-- LibCharacterKnowledge.EVENT_INITIALIZED. If your add-on checks
-- character knowledge too early, you might get some "false" results
-- that will later turn to "true" once LibCharacterKnowledge initializes.
-- If this is a worry for you, register your own EVENT_INITIALIZED
-- event listener in your add-on.

LibMotif = LibMotif or {}

LibMotif.name = "LibMotif"


-- Does the current character know this crafting motif for
-- axes, chests, whatever?
--
-- motif_id is a motif number, range [1..117].
--
-- page_num is a purple motif page index, [1..14].
--
function LibMotif.IsKnown(motif_id, page_num)
                        -- Convert from UI-visible chapter indices to
                        -- the ones LibCharacterKnowledge expects.
    local lck_index = LibMotif.MOTIF_PAGE_TO_CHAPTER[page_num or ITEM_]
    local r = LibCharacterKnowledge.GetMotifKnowledgeForCharacter(
                motif_id, lck_index)
    local is_known = r == LibCharacterKnowledge.KNOWLEDGE_KNOWN
    return is_known
end
