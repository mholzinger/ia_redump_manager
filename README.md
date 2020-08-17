# Archive.org redump set manager

## Setting up the internet archive python library and ia tool

#### Create an account at Internet Archive, Install the API (Python) and IA tool

1. Make an archive.org account and get the API keys: 
-> https://archive.org/account/s3.php


Complete your API access and secret key setup in `~/.config/ia.ini`

```
[s3]
access = yabbadabbadoo
secret = yabbadabbadoo
```

2. Using python 3 install internetarchive api.

```
pip install internetarchive
```

3. Then grab the IA binary from below: (https://archive.org/services/docs/api/internetarchive/installation.html)

```
curl -LOs https://archive.org/download/ia-pex/ia
chmod +x ia
```

