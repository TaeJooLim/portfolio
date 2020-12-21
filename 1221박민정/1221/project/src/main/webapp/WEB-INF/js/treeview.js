$(function() {
    $("#tree").treeview({
        collapsed: false,
        animated:0,
        control: "#sidetreecontrol",
        persist: "location"
    });

    $("#tree-org").treeview({
        collapsed: false,
        animated:0,
        control: "#sidetreecontrol-org",
        persist: "location"
    });
});