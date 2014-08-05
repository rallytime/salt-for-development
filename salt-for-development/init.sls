# Set up new user
dev-user:
  user.present:
    - home: /home/dev-user
    - empty_password: True
    - require_in:
      - file: /home/dev-user/SaltStack

# Create SaltStack directory to clone repos into
/home/dev-user/SaltStack:
  file.directory:
    - user: dev-user
    - makedirs: True
    - require_in:
      - git: local_repo_name
      - git: local_repo_email

# Set global git config for username
local_repo_name:
  git.config:
    - name: user.name
    - value: rallytime
    - is_global: True
    - require_in:
      - git: rallytime_salt
      - git: rallytime_salt_testing

# Set global git config for email
local_repo_email:
  git.config:
    - name: user.email
    - value: nicole@saltstack.com
    - is_global: True
    - require_in:
      - git: rallytime_salt
      - git: rallytime_salt_testing
