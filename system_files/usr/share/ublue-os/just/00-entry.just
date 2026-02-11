set allow-duplicate-recipes := true
set ignore-comments := true

_default:
    ujust --choose

# Imports
import "/usr/share/ublue-os/just/apps.just"
import "/usr/share/ublue-os/just/changelog.just"
import "/usr/share/ublue-os/just/default.just"
import "/usr/share/ublue-os/just/shared.just"
import "/usr/share/ublue-os/just/system.just"
import "/usr/share/ublue-os/just/update.just"
import? "/usr/share/ublue-os/just/60-custom.just"