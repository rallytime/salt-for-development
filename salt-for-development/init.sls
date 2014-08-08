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

# Make sure git is installed
git:
  pkg.installed:
    - name: git
    - require_in:
      - git: config_name
      - git: config_email

# Set global git config for username
config_name:
  git.config:
    - name: user.name
    - value: rallytime
    - user: dev-user
    - is_global: True
    - require_in:
      - git: salt
      - git: salt_testing

# Set global git config for email
config_email:
  git.config:
    - name: user.email
    - value: nicole@saltstack.com
    - user: dev-user
    - is_global: True
    - require_in:
      - git: salt
      - git: salt_testing
