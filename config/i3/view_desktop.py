import subprocess
import json

WORKSPACE_PREFIX = "desktop-"

monitors = json.loads(subprocess.run(
    ["i3-msg", "-t", "get_outputs"],
    capture_output=True,
    text=True
).stdout.strip())

commmand = ""

for monitor in reversed(monitors):
    if not monitor["active"] or not monitor["current_workspace"]:
        continue

    print("\n\n\n")
    print(monitor)

    commmand += f"workspace \"{monitor["current_workspace"]}\" "

    if WORKSPACE_PREFIX in monitor["current_workspace"]:
        commmand += f"workspace \"{monitor["current_workspace"].split(WORKSPACE_PREFIX)[
            1]}\" "
    else:
        commmand += f"workspace \"{WORKSPACE_PREFIX +
                                   monitor["current_workspace"]}\" "

subprocess.run(["i3-msg", commmand])
