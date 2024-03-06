import os
import subprocess
from typing import List

from libqtile import layout, bar, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # CHANGE FOCUS
    Key([mod], "Left", lazy.layout.left(),
        desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(),
        desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(),
        desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(),
        desc="Move focus up"),
    Key(["mod1"], "Tab", lazy.layout.next(),
        desc="Move window focus to next window"),

    # SHUFFLE WINDOWS
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(),
        desc="Move window up"),
    Key([mod, "shift"], "space", lazy.window.toggle_floating(),
        desc="Toggle flotating layout"),

    # RESIZE WINDOWS
    Key([mod, "control"], "Left", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(),
        desc="Reset all window sizes"),

    # WINDOWS FUNCTIONS
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen"),
    Key([mod], "w", lazy.window.kill(),
        desc="Kill focused window"),

    # QTILE FUNCTIONS
    Key([mod, "control"], "Tab", lazy.next_layout(),
        desc="Toggle between layouts"),
    Key([mod, "control"], "r", lazy.restart(),
        desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(),
        desc="Shutdown Qtile"),

    # SPAWN WINDOWS
    Key([mod], "Return", lazy.spawn(terminal),
        desc="Launch terminal"),
    Key(["mod1"], "space", lazy.spawn("rofi -show drun"),
        desc="Launch terminal"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # HARDWARE FUNCTIONS
    # BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 10%+"),
        desc="Brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-"),
        desc="Brightness down"),

    # VOLUME
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+"),
        desc="Volume up"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%-"),
        desc="Volume up"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle"),
        desc="Volume mute"),

    # SCREENSHOTS
    Key([], "Print", lazy.spawn("gnome-screenshot"),
        desc="Take screenshot of full screen"),
    Key([mod, "shift"], "Print", lazy.spawn("gnome-screenshot -a"),
        desc="Take screenshot of an area"),

    # MEDIA
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"),
        desc="Media next"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"),
        desc="Media Prev"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),
        desc="Media play/pause"),
]

# WORKSPACES
group_names = [
    ("", {'layout': 'tile'}),
    ("", {'layout': 'max'}),
    ("", {'layout': 'tile'}),
    ("", {'layout': 'tile'}),
    ("", {'layout': 'tile'}),
    ("", {'layout': 'max'}),
    ("", {'layout': 'max'}),
    ("漣", {'layout': 'max'}),
    ("ﭮ", {'layout': 'max'})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.extend([
        # SWITCH TO GROUP
        Key([mod], str(i), lazy.group[name].toscreen(),
            desc="Switch to group {}".format(name)),
        Key([mod], "Tab", lazy.screen.next_group(),
            desc="Switch to next group"),
        Key([mod, "shift"], "Tab", lazy.screen.prev_group(),
            desc="Switch to prev group"),

        # SWITCH AND MOVE FOCUSED WINDOWS TO GROUP
        Key([mod, "shift"], str(i), lazy.window.togroup(name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(name)),
    ])


# COLORS
colors = [
    ["#1d2021", "#1d2021"],  # 0 background
    ["#3c3836", "#3c3836"],  # 1 background lighter
    ["#ebdbb2", "#ebdbb2"],  # 2 foreground
    ["#cc241d", "#cc241d"],  # 3 red
    ["#98971a", "#98971a"],  # 4 green
    ["#d79921", "#d79921"],  # 5 yellow
    ["#458588", "#458588"],  # 6 blue
    ["#689d6a", "#689d6a"],  # 7 cyan
    ["#b16286", "#b16286"],  # 8 magenta
    ["#d65d0e", "#d65d0e"],  # 9 orange
    ["#a89984", "#a89984"],  # 10 white
    ["#928374", "#928374"],  # 11 grey
    ["#665c54", "#665c54"],  # 12 dark grey
]

# LAYOUTS
layout_theme = {
    "margin": 2,
    "border_width": 2,
    "border_focus": "#080808",
    "border_normal": "#080808",
}

layouts = [
    layout.Max(**layout_theme),
    layout.Tile(**layout_theme, add_after_last=True, shift_windows=True),
    layout.Stack(stacks=2, **layout_theme),
    layout.MonadTall(**layout_theme, ratio=0.55),
    layout.Floating(**layout_theme),
    layout.TreeTab(
        font="San Francisco display",
        fontsize=16,
        section_fontsize=10,
        border_width=2,
        bg_color="#282828",
        active_bg="#689d6a",
        active_fg="#ebdbb2",
        inactive_bg="#665c54",
        inactive_fg="#ebdbb2",
        padding_x=6,
        padding_y=6,
        section_top=10,
        section_bottom=20,
        level_shift=8,
        vspace=3,
        panel_width=164
    ),
    # layout.Bsp(**layout_theme),
    # layout.Columns(**layout_theme),
    # layout.Zoomy(**layout_theme),
    # layout.RatioTile(**layout_theme),
]

# DEFAULT WIDGET SETTINGS
widget_defaults = dict(
    font="San Francisco display",
    fontsize=18,
    padding=6,
    foreground=colors[2],
    background=colors[0]
)

extension_defaults = widget_defaults.copy()


# WIDGETS
def init_widgets_list():
    widgets_list = [
        # LEFT SIDE
        widget.Spacer(
            length=2,
            background=colors[0],
        ),
        widget.Sep(
            linewidth=2,
            foreground=colors[12],
            background=colors[0],
        ),
        widget.TextBox(
            text="  ",
            fontsize=24,
            foreground=colors[2],
            background=colors[0],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),
        widget.GroupBox(
            disable_drag=True,
            highlight_method="line",
            highlight_color=colors[12],
            this_current_screen_border=colors[7],
            rounded=True,
            active=colors[2],
            inactive=colors[11],
            borderwidth=2,
            fontsize=24,
            margin_y=4,
            margin_x=0,
            padding_y=0,
            padding_x=8,
            foreground=colors[10],
            background=colors[1],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),

        widget.Spacer(
            length=5,
            background=colors[0]
        ),
        widget.Spacer(
            length=bar.STRETCH,
            background=colors[0]
        ),

        # CENTER SIDE
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),
        widget.TextBox(
            text="",
            fontsize=24,
            foreground=colors[4],
            background=colors[1]
        ),
        widget.Clock(
            format='%a %d %b',
            foreground=colors[2],
            background=colors[1]
        ),
        widget.Clock(
            format='%I:%M %p',
            foreground=colors[2],
            background=colors[1]
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),

        # RIGHT SIDE
        widget.Spacer(
            length=bar.STRETCH,
            background=colors[0]
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),
        widget.Systray(
            icon_size=16,
            background=colors[1],
        ),
        widget.TextBox(
            text=" ﵁",
            fontsize=24,
            foreground=colors[6],
            background=colors[1],
        ),
        widget.CurrentLayout(
            foreground=colors[2],
            background=colors[1],
        ),

        widget.TextBox(
            text=" ",
            fontsize=24,
            foreground=colors[8],
            background=colors[1],
        ),
        widget.Volume(
            update_interval=0.3,
            step=10,
            foreground=colors[2],
            background=colors[1],
        ),
        widget.TextBox(
            text=" ",
            fontsize=24,
            foreground=colors[5],
            background=colors[1],
        ),
        widget.Battery(
            update_interval=60,
            format="{percent:2.0%}",
            foreground=colors[2],
            background=colors[1],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=32,
            foreground=colors[1],
            background=colors[0],
        ),
        widget.TextBox(
            text="  ",
            fontsize=24,
            foreground=colors[3],
            background=colors[0],
        ),
        widget.Sep(
            linewidth=2,
            foreground=colors[12],
            background=colors[0],
        ),
        widget.Spacer(
            length=2,
            background=colors[0],
        ),
    ]
    return widgets_list


# SCREENS
screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets_list(),
            opacity=1,
            bottom=bar.Gap(18),
            left=bar.Gap(18),
            right=bar.Gap(18),
            size=28,
            margin=[2, 2, 2, 2]
        ),
        wallpaper='~/Pictures/wallpapers/misc/hex.jpg',
        wallpaper_mode='stretch',
    )
]


# ASSIGN APPS TO GROUPS
@hook.subscribe.client_new
def assign_app_group(client):
    d = {}
    d[group_names[0][0]] = ['code']
    d[group_names[1][0]] = ['firefox', 'libreWolf', 'google-chrome-beta']
    d[group_names[2][0]] = ['tilix']
    d[group_names[3][0]] = []
    d[group_names[4][0]] = ['totem']
    d[group_names[5][0]] = ['vlc', 'obs']
    d[group_names[6][0]] = []
    d[group_names[7][0]] = ['nautilus']
    d[group_names[8][0]] = ['discord']

    wm_class = client.window.get_wm_class()[0]
    for i in range(len(d)):
        if wm_class in list(d.values())[i]:
            group = list(d.keys())[i]
            client.togroup(group)
            client.group.cmd_toscreen(toggle=False)


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(title='branchdialog'),
    Match(title='Confirmation'),
    Match(title='pinentry'),
    Match(title='Qalculate!'),
    Match(wm_class='confirmreset'),
    Match(wm_class='kdenlive'),
    Match(wm_class='makebranch'),
    Match(wm_class='maketag'),
    Match(wm_class='pinentry-gtk-2'),
    Match(wm_class='ssh-askpass'),
])


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "qtile"
