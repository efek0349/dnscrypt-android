# DNSCrypt Proxy 2 for Android | privacy oriented

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features

- For all features please refer to the [OFFICIAL PAGE](https://github.com/DNSCrypt/dnscrypt-proxy#features)
- All binary files are downloaded from the [OFFICIAL RELEASE PAGE](https://github.com/DNSCrypt/dnscrypt-proxy/releases)


## Pre-built binaries

Up-to-date, pre-built binaries are available for:

- Android/arm
- Android/arm64
- Android/x86
- Android/x86_64


## Differences from the main dnscrypt-proxy project

- `server_names` = `acsacsar-ams-ipv4` [NLD], `arvind-io` [IND], `bcn-dnscrypt` [ESP], `d0wn-tz-ns1` [TZA], `dnscrypt.be` [BEL], `dnscrypt.ca-1` [CAN], `dnscrypt.ca-2` [CAN], `dnscrypt.eu-dk` [DNK], `dnscrypt.eu-nl` [NLD], `dnscrypt.one` [DEU], `dnscrypt.pl` [POL], `dnscrypt.uk-ipv4` [GBR], `ev-canada` [CAN], `jp.tiar.app` [JPN], `meganerd` [NLD], `moulticast-ca-ipv4` [CAN], `moulticast-de-ipv4` [DEU], `moulticast-fr-ipv4` [FRA], `moulticast-sg-ipv4` [SGP], `moulticast-uk-ipv4` [GBR], `plan9-dns` [USA], `publicarray-au` [AUS], `pwoss.org-dnscrypt` [DEU], `sarpel-dns-istanbul` [TUR], `scaleway-ams` [NLD], `scaleway-fr` [FRA], `serbica` [NLD], `v.dnscrypt.uk-ipv4` [GBR], `ventricle.us` [USA], `zackptg5-us-il-ipv4` [USA] are the resolvers in use.

- `doh_servers` = `false` (disable servers implementing the `DNS-over-HTTPS` protocol)

- `require_dnssec` = `true` (server must support `DNSSEC` security extension)

- `timeout` = `1000` (set the max. response time of a single DNS query from `5000` to `1000` ms.)

- `blocked_query_response` = `'refused'` (set `refused` response to blocked queries)

- `dnscrypt_ephemeral_keys` = `true` (create a new, unique key for every single DNS query)

- `fallback_resolvers` = `['9.9.9.9:53', '1.1.1.1:53']`

- `netprobe_address` = `'9.9.9.9:53'`

- `block_ipv6` = `true` (immediately respond to IPv6-related queries with an empty response)

- `blocked_names_file`, `blocked_ips_file`, `allowed_names_file` and `allowed_ips_file` options enabled. (you can now filter your web content, to know how, please refer to the [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Filters) or take a look at my [block repository](https://git.nixnet.services/quindecim/block))

- `anonymized_dns` feature enabled. (`routes` are indirect ways to reach DNSCrypt servers, each resolver has 2 relays assigned)

- `skip_incompatible` = `true` (skip resolvers incompatible with anonymization instead of using them directly)

- `direct_cert_fallback` = `false` (prevent direct connections through the resolvers for failed certificate retrieved via relay)

- `disabled_server_names` = `['sarpel-dns-istanbul']`

## Installation

1. Download the latest `.zip` file from the [Releases](https://git.nixnet.services/quindecim/dnscrypt-proxy-android/releases) page or from my [dnscrypt-proxy-android | CHANNEL](https://t.me/dnscrypt_proxy) on Telegram and flash it with [Magisk](https://github.com/topjohnwu/Magisk):

```
Magisk Manager > Modules > + > dnscrypt-proxy-android-v*.zip
```

2. Reboot your device.

3. Test your DNS: https://dnsleaktest.com/


### Configuration (post-installing)

- You can edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml`, or `/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml`.
- For more detailed configuration please refer to [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration).
- For more support on a good privacy oriented setup, join our group at [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitations) on Telegram.


#### AFWall+ users only

If you experience no connection issue after flashing the module I suggest you to insert these scripts: (in both, enter and shutdown boxes)

```
iptables -A "afwall" -d 127.0.0.1 -p tcp --dport 5354 -j ACCEPT
iptables -A "afwall" -d 127.0.0.1 -p udp --dport 5354 -j ACCEPT
```

The issue is related to the use of `AFWall+` and only happens on some devices, it depends on how the DNS configuration is implemented in the device itself.


## Changelog

[Full changelog](https://git.nixnet.services/quindecim/dnscrypt-proxy-android/blob/master/CHANGELOG.md)


## Credits
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/DNSCrypt/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributors](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
