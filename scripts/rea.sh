# REA-specific configuration
export REA_LDAP_USER=alistair.burrowes
export AWS_DEFAULT_REGION=ap-southeast-2

# Enable aws-shortcuts
if [ -e $HOME/.aws-shortcuts/iam-roles.txt ]; then
    source $HOME/.aws-shortcuts/aws-shortcuts.sh
else
    echo "Cannot source `aws-shortcuts`: iam-roles.txt is missing."
    echo "To fix run:"
    echo ""
    echo "    rea-as saml > ~/.aws-shortcuts/iam-roles.txt"
    echo ""
fi
