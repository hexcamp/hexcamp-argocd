function(
  cbcBcPassword='xxx',
  dailyHiveVanPassword='xxx',
  cityNewsVanPassword='xxx',
  globalNewsBcPassword='xxx',
  theThunderbirdPassword='xxx',
  georgiaStraightPassword='xxx',
)
  [
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'atproto-secrets',
        namespace: 'newshub-vanhex',
      },
      type: 'Opaque',
      data: {
        cbc_bc_password: cbcBcPassword,
        dailyhive_van_password: dailyHiveVanPassword,
        citynews_van_password: cityNewsVanPassword,
        globalnews_bc_password: globalNewsBcPassword,
        thethunderbird_password: theThunderbirdPassword,
        georgiastraight_password: georgiaStraightPassword,
      },
    },
  ]
