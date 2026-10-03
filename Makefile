all: invite-github.webp invite-gitlab.webp assign-issue-github.webp assign-issue-gitlab.webp

invite-github.webp:
	ffmpeg -framerate 1/2 -loop 0 -pattern_type glob -i 'screenshots/invite-github/*.png' invite-github.webp

invite-gitlab.webp:
	ffmpeg -framerate 1/2 -loop 0 -pattern_type glob -i 'screenshots/invite-gitlab/*.png' invite-gitlab.webp

assign-issue-github.webp:
	ffmpeg -framerate 1/2 -loop 0 -pattern_type glob -i 'screenshots/assign-issue-github/*.png' assign-issue-github.webp

assign-issue-gitlab.webp:
	ffmpeg -framerate 1/2 -loop 0 -pattern_type glob -i 'screenshots/assign-issue-gitlab/*.png' assign-issue-gitlab.webp
