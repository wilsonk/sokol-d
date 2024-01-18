module examples.user_data;

import sg = sokol.gfx;
import sapp = sokol.app;
import log = sokol.log;
import sgapp = sokol.glue;

import ikod.containers.hashmap;

extern (C):

struct ExampleUserData {
    ubyte data;    
    HashMap!(ubyte, int) map;
}

void init() @safe
{
    sg.Desc gfx = {
        context: sgapp.context(),
        logger: {func: &log.slog_func}
    };
    sg.setup(gfx);
}

void frame_userdata(scope void* userdata) @trusted
{
    auto state = cast(ExampleUserData*) userdata;
    
    state.data++;
    if (state.data % 13 == 0) {
        state.map[state.data] = state.data * 13 / 3; 
    }
    if (state.data % 12 == 0 && state.data % 15 == 0) {
        state.map.clear();
    }
    version(D_BetterC){
        import core.stdc.stdio;
        printf("ExampleUserData[%d:%d, %d]\n", state.map.length, state.data, state.map.fetch(state.data).value);
    } else {
        import std.stdio;
        writeln(*state);
    }

    sg.PassAction pass_action = {};
    sg.beginDefaultPass(pass_action, sapp.width(), sapp.height());
    sg.endPass();
    sg.commit();
}

void cleanup() @safe
{
    sg.shutdown();
}

void main()
{
    ExampleUserData userData;

    sapp.Desc runner = {
        window_title: "user-data.d",
        init_cb: &init,
        frame_userdata_cb: &frame_userdata,
        cleanup_cb: &cleanup,
        user_data: &userData,
        width: 640,
        height: 480,
        sample_count: 4,
        win32_console_attach: true,
        icon: {sokol_default: true},
        logger: {func: &log.func}
    };
    sapp.run(runner);
}
