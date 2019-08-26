//매장검색공통팝업
function gf_commShopListPop(obj) {
    gf_openPop("/comm/initCommShopPop.do", 700, "", obj);
}

function gf_showIconForTree(treeId, treeNode) {
    return !treeNode.isParent;
};