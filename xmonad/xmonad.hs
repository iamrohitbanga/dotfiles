-- xmonad config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Actions.CycleWS
import XMonad.Actions.SwapWorkspaces
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.Decoration
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Util.NamedWindows (getName)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Control.Monad
import Data.List (sortBy)
import Data.Function (on)

-- PolyBar config based on https://github.com/boylemic/configs/blob/master/xmonad/xmonad.hs.polybar
-- https://www.youtube.com/watch?v=d1KWL2MKXZw
-- Requires installation of xmonad-log https://github.com/xintron/xmonad-log/releases
-- And corresponding polybar config files from https://github.com/boylemic/configs/tree/master/xmonad/polybar
-- Copy polybar configs to ~/.config/polybar/
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
-- myTerminal = "/usr/bin/xterm"
-- myTerminal = "~/.cargo/bin/alacritty"
myTerminal = "~/.local/kitty.app/bin/kitty"


-- Colors
gray      = "#7F7F7F"
gray2     = "#222222"
red       = "#900000"
blue      = "#2E9AFE"
white     = "#eeeeee"

------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
-- myWorkspaces = ["1:home", "2:quick", "3:work", "4:build", "5","6", "7", "8", "9:social", "0:extra"]

-- xmobarEscape = concatMap doubleLts
--   where doubleLts '<' = "<<"
--         doubleLts x    = [x]

myWorkspaces            :: [String]
myWorkspaces            = ["1:\xf269","2:\xf120","3:\xf0e0", "4:\xf07c","5:\xf1b6","6:\xf281","7:\xf04b","8:\xf167","9"]

--  where
--         clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
--                             (i,ws) <- zip [1..9] l,
--                            let n = i ]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "Chromium"       --> doShift "2:web"
    , resource  =? "desktop_window" --> doIgnore
    , className =? "Galculator"     --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Google-chrome"  --> doShift "2:web"
    , resource  =? "gpicview"       --> doFloat
    , resource  =? "kdesktop"       --> doIgnore
    , className =? "MPlayer"        --> doFloat
    , resource  =? "skype"          --> doFloat
    , resource  =? "skype"          --> doShift "1:chat"
    , className =? "Pidgin"         --> doShift "1:chat"
    , className =? "VirtualBox"     --> doShift "4:vm"
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
-- A beginners guide here: https://betweentwocommits.com/blog/xmonad-layouts-guide
--
myLayout = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    tabbed shrinkText tabConfig |||
    GridRatio (3/2) |||
    Grid |||
    noBorders (fullscreenFull Full))


------------------------------------------------------------------------
-- Colors and borders
-- Currently based on the ir_black theme.
--
myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = def {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod1Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Lock the screen using xscreensaver.
  , ((modMask .|. controlMask, xK_l),
     spawn "xscreensaver-command -lock")

  -- Use this to launch programs without a key binding.
  , ((modMask, xK_p),
     spawn $ "rofi -show run -fullscreen -theme /usr/share/rofi/themes/Paper.rasi")

  -- Use this to switch windows
  , ((modMask, xK_w),
     spawn $ "rofi -show window -theme /usr/share/rofi/themes/Paper.rasi")

  -- Use this to open file explorer
  , ((mod4Mask, xK_e),
     spawn $ "nautilus --no-desktop --browser")

  -- Take a screenshot in select mode.
  -- After pressing this key binding, click a window, or draw a rectangle with
  -- the mouse.
  , ((modMask .|. shiftMask, xK_p),
     spawn "select-screenshot")

  -- Take full screenshot in multi-head mode.
  -- That is, take a screenshot of everything you see.
  , ((modMask .|. controlMask .|. shiftMask, xK_p),
     spawn "screenshot")

  , ((modMask, xK_y), spawn $ "polybar-msg cmd toggle" )

  -- Mute volume.
  , ((0, 0x1008FF12),
     spawn "amixer -q set Front toggle")

  -- Decrease volume.
  , ((0, 0x1008FF11),
     spawn "amixer -q set Front 10%-")

  -- Increase volume.
  , ((0, 0x1008FF13),
     spawn "amixer -q set Front 10%+")

  -- Audio previous.
  , ((0, 0x1008FF16),
     spawn "")

  -- Play/pause.
  , ((0, 0x1008FF14),
     spawn "")

  -- Audio next.
  , ((0, 0x1008FF17),
     spawn "")

  -- Eject CD tray.
  , ((0, 0x1008FF2C),
     spawn "eject -T")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask .|. shiftMask, xK_Tab),
     windows W.focusUp)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++


    -------------------------------------------------------------------
    -- ctrl+[1 .. ], Switch to workspace N
    -- ctrl+shift+[1 .. ], View to workspace N
    -- meta+[1 .. ], Move client to workspace N and follow
    -- meta+shift+[1 .. ], Move client to workspace N
    -- alt+[1 .. ], Swap with workspace N and follow
    -- alt+shift+[1 .. ], Swap with workspace N
    [ ((m, k), windows $ f i)
        | (i, k) <- zip (workspaces conf) workspaceKeys
        , (f, m) <- [ (W.greedyView                   , mod4Mask)
                    -- , (W.view                         , mod4Mask .|. shiftMask)
                    , (liftM2 (.) W.greedyView W.shift, controlMask .|. mod4Mask)
                    -- , (W.shift                        , controlMask .|. mod4Mask .|. shiftMask)
                    , (swapWithCurrent                , controlMask .|. mod4Mask .|. shiftMask)
                    -- , (silentSwapWithCurrent          , mod1Mask .|. shiftMask)
                    ]
    ]
    ++

    -------------------------------------------------------------------
    -- ctrl+meta+F[1 .. ], Switch to screen N
    -- ctrl+meta+shift+F[1 .. ], Move client to screen N
    -- alt+meta+F[1 .. ], Swap with screen N and follow
    -- alt+meta+shift+F[1 .. ], Swap with screen N
    -- [ ((m, k), screenWorkspace i >>= flip whenJust (windows . f))
    --     | (i, k) <- zip [0 .. ] workspaceKeys
    --     , (f, m) <- [ (W.view               , controlMask .|. mod4Mask)
    --                 , (W.shift              , controlMask .|. mod4Mask .|. shiftMask)
    --                 , (swapWithCurrent      , mod1Mask .|. mod4Mask)
    --                 , (silentSwapWithCurrent, mod1Mask .|. mod4Mask .|. shiftMask)
    --                 ]
    -- ]
    -- ++

    -------------------------------------------------------------------
    -- ctrl+alt+[left,right], Switch to workspace to the left or right
    -- meta+[left,right], Move window to left or right and follow
    -- meta+shift+[left,right], Move window to left or right
    -- alt+meta+[left,right], Swap with workspace to left or right and follow
    -- alt+meta+shift+[left,right], Swap with workspace to left or right
    [ ((m, xK_Left ), c)
        | (c, m) <- [ (prevWS               , controlMask .|. mod1Mask)
                    , (shiftToPrev >> prevWS, controlMask .|. mod4Mask)
                    -- , (shiftToPrev          , mod4Mask .|. shiftMask)
                    , (swapTo Prev          , controlMask .|. mod4Mask .|. shiftMask)
                    -- , (swapTo Prev >> nextWS, mod1Mask .|. mod4Mask .|. shiftMask)
                    ]
    ]
    ++
    [ ((m, xK_Right), c)
        | (c, m) <- [ (nextWS               , controlMask .|. mod1Mask)
                    , (shiftToNext >> nextWS, controlMask .|. mod4Mask)
                    -- , (shiftToNext          , mod4Mask .|. shiftMask)
                    , (swapTo Next          , controlMask .|. mod4Mask .|. shiftMask)
                    -- , (swapTo Next >> prevWS, mod1Mask .|. mod4Mask .|. shiftMask)
                    ]
    ]
    -- ++

    -- -------------------------------------------------------------------
    -- -- ctrl+alt+[up,down], Switch to next/previous screen
    -- -- meta+[up,down], Move window to next/previous screen and follow
    -- -- meta+shift+[up,down], Move window to next/previous screen
    -- -- alt+meta+[up,down], Swap with next/previous screen and follow
    -- -- alt+meta+shift+[up,down], Swap with next/previous screen
    -- [ ((m, xK_Up   ), c)
    --     | (c, m) <- [ (prevScreen                   , controlMask .|. mod1Mask)
    --                 , (shiftPrevScreen >> prevScreen, mod4Mask)
    --                 , (shiftPrevScreen              , mod4Mask .|. shiftMask)
    --                 , (swapPrevScreen >> nextScreen , mod1Mask .|. mod4Mask)
    --                 , (swapPrevScreen               , mod1Mask .|. mod4Mask .|. shiftMask)
    --                 ]
    -- ]
    -- ++
    -- [ ((m, xK_Down ), c)
    --     | (c, m) <- [ (nextScreen                   , controlMask .|. mod1Mask)
    --                 , (shiftNextScreen >> nextScreen, mod4Mask)
    --                 , (shiftNextScreen              , mod4Mask .|. shiftMask)
    --                 , (swapNextScreen >> prevScreen , mod1Mask .|. mod4Mask)
    --                 , (swapNextScreen               , mod1Mask .|. mod4Mask .|. shiftMask)
    --                 ]
    -- ]
        where
            workspaceKeys = [xK_1 .. xK_F9]
            silentSwapWithCurrent i w = W.view (W.currentTag w) $ swapWithCurrent i w

------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]


------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--


------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
myStartupHook = do
    spawn "~/.config/polybar/launch.sh"
    spawnOnce "nm-applet"
    spawnOnce "blueman-applet"
    spawnOnce "volumeicon"
    setWMName "LG3D"
    -- spawn "compton -b"
    -- spawnOnce "redshift-gtk"

------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main :: IO ()
main = do

    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    xmonad $ewmh $ docks $ defaults { logHook = dynamicLogWithPP (myLogHook dbus) }



-- launcherHook :: ManageHook
-- launcherHook = resource =? launcherString --> doIgnore

eventLogHookForPolyBar = do
    winset <- gets windowset
    title <- maybe (return "") (fmap show . getName) . W.peek $ winset
    let currWs = W.currentTag winset
    let wss = map W.tag $ W.workspaces winset

    io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
    io $ appendFile "/tmp/.xmonad-workspace-log" (wsStr currWs wss ++ "\n")

    where
      fmt currWs ws
            | currWs == ws = "[" ++ ws ++ "]"
            | otherwise    = " " ++ ws ++ " "
      wsStr currWs wss = join $ map (fmt currWs) $ sortBy (compare `on` (!! 0)) wss



-- Override the PP values as you would otherwise, adding colors etc depending
-- on  the statusbar used
myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ blue ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ gray ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap ("%{F" ++ gray ++ "} ") " %{F-}"
    , ppTitle = wrap ("%{F" ++ gray2 ++ "} ") " %{F-}"
    }
-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

--     dbus <- D.connectSession
--     D.requestName dbus (D.busName_ "org.xmonad.Log")
--         [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
--
--     -- xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
--     xmonad . ewmh $ defaults {
--           handleEventHook = docksEventHook
--         , manageHook = manageDocks <+> myManageHook
--         , startupHook = setWMName "LG3D"
--     }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = smartBorders $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
