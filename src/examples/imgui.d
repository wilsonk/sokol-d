//------------------------------------------------------------------------------
//  imgui.d
//
//  Using cimgui+sokol, based on https://github.com/floooh/cimgui-sokol-starterkit
//------------------------------------------------------------------------------

module examples.imgui;

import sg = sokol.gfx;
import sgapp = sokol.glue;
import sapp = sokol.app;
import imgui = sokol.imgui;
import log = sokol.log;

extern (C):

struct State{
    sg.PassAction pass_action = {
        colors: [{
            load_action: sg.LoadAction.Clear,
            clear_value: { r: 0.0, g: 0.5, b: 1.0, a: 1.0 },
        }]
    };
}
static State state;

void init()
{
    sg.Desc gfx = {
        context: sgapp.context(),
        logger: {func: &log.slog_func}
    };
    sg.setup(gfx);
    imgui.simgui_desc_t imgui_desc = {0};
    imgui.simgui_setup(&imgui_desc);
}

void frame()
{
    imgui.simgui_frame_desc_t imgui_desc = {
        width: sapp.width(),
        height: sapp.height(),
        delta_time: sapp.frameDuration(),
        dpi_scale: sapp.dpiScale(),
    };
    imgui.simgui_new_frame(&imgui_desc);

    /*=== UI CODE STARTS HERE ===*/
    const imgui.ImVec2 window_pos = {0,0};
    const imgui.ImVec2 window_pos_pivot = {0,0};
    const imgui.ImVec2 window_size = {400, 100};
    imgui.igSetNextWindowPos(window_pos, imgui.ImGuiCond_.ImGuiCond_Once, window_pos_pivot);
    imgui.igSetNextWindowSize(window_size, imgui.ImGuiCond_.ImGuiCond_Once);
    imgui.igBegin("Hello Dear ImGui!".ptr, null, imgui.ImGuiWindowFlags_.ImGuiWindowFlags_None);
    const(char)* label = "Background";
    float[3] rgb = [state.pass_action.colors[0].clear_value.r, state.pass_action.colors[0].clear_value.g, state.pass_action.colors[0].clear_value.b];
    imgui.igColorEdit3(label, rgb, imgui.ImGuiColorEditFlags_.ImGuiColorEditFlags_None);
    imgui.igEnd();
    /*=== UI CODE ENDS HERE ===*/

    sg.beginDefaultPass(state.pass_action, sapp.width(), sapp.height());
    sg.endPass();
    sg.commit();
}

void event(const(sapp.Event)* ev)
{
    imgui.simgui_handle_event(ev);
}

void cleanup()
{
    imgui.simgui_shutdown();
    sg.shutdown();
}

void main()
{
    sapp.Desc runner = {
        window_title: "imgui.d",
        init_cb: &init,
        frame_cb: &frame,
        cleanup_cb: &cleanup,
        event_cb: &event,
        width: 800,
        height: 600,
        icon: {sokol_default: true},
        logger: {func: &log.func}
    };
    sapp.run(runner);
}
