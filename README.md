[![Build Status][build status badge]][build status]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]

# PackageTemplate
A template for Swift packages on GitHub

It is a little **opinionated**, but mostly just stuff that I've found useful. Feel free to customize as needed. And if you have ideas for ways to improve this, open an issue or PR!

## Repository Details

- Naming

The golden rule: your package name should **not** be the same as public type within your package. This can result in a ridiculous situation where the compiler cannot distinuous between the module name and type name, and has make my life difficult in the past. Someone please send me a blog post or something about this and I will link to it.

I'm a fan of CapitalCase, and I don't think the word "Swift" should be in the name either.

- Turn off "Packages" and "Deployments"

Neither of them currently apply to Swift

## Metadata

- License

This is non-optional. Many users, for very valid reasons, will not even look at a package without a license. GitHub makes this easy. I have been a long-time user of the BSD 3-clause license. It is very permission, like MIT, but also specifically limits implicit endorcements from those involved.

I'm, in general, not a fan of viral licenses, especially when that virality applies to linking. However, I appeciate why that was designed the way it was. Preventing open source abuse and exploitation is important and your choice of license can really matter there.

- Code of Conduct

"Let's be excellent to each other" is great! But, having a concrete set of rules about what that actually means, and what happens should those rules be broken is important. The [Contributor Covenant](https://www.contributor-covenant.org) has become popular and I think it is a great choice.

- Badges

I like throwing a few badges up on my repos to provide some glanceable information. I think it is easy to go overboard here, but you should also feel good about making this your own!

## Package.swift

- Platforms

For a long time, I thought leaving platforms empty was the most compatible thing to do. However, this leave the effective platform/version up to the compiler. And, that can produce surprising results that change over time. Being explicit is best.

- Swift 5.8

This allows you to use `.enableExperimentalFeature("StrictConcurrency")`. Using concurrency without compiler checks is a bad idea. And you may be using it without even realizing it. `enableExperimentalFeature` requres 5.8, but the actual checks themselves require 5.9.

## GitHub Actions

GitHub actions are mostly great. But there are two things that make them very un-great. GitHub is incredibly slow about bringing up new versions of macOS. This means "macOS-latest" is **never** the latest released version of macOS. That in itself might be a problem for a package that supports macOS. But, it can also impact the default Xcode version.

The second problem is simulator names change and `xcodebuild` makes it very hard to not care. I have given up relying on defaults here, and I always make things explicit. Unforutnately this means manual maintanence, especially around WWDC.

- Host OS
- Xcode version
- Simulators names

If you have tricks/hacks/custom actions to make this better, **please** let me know.

## Swift Package Index

The [SPI](https://swiftpackageindex.com) is a no-brainer.

- Discoverability

If I have an idea for a library, I always do some searching on SPI first.

- Build Checks

Kind of like a mini CI. SPI will build your packages for many swift/platform combinations. I think making it very clear up front what platforms your package supports is very useful.

- Hosted Documentation

Perhaps the most underrated feature. If you include DocC in your package, SPI will **host** it for you. You need a `.spi.yml` file for this to work.

## Style

For a very long time, I thought tabs vs spaces was a stupid thing to get worked up about. I thought spaces were clearly the right choice, and I never thought more about it. Then one day I learned that tabs can offer [accesibility improvements](https://adamtuttle.codes/blog/2021/tabs-vs-spaces-its-an-accessibility-issue/) for low-vision people. And that same advantage also helps to style code the way people prefer. So I switched and I encourage you to do same.

Despite Xcode not supporting it, I still think including [editorconfig](https://editorconfig.org) support is a good idea. I'm a dreamer.

## Contributing and Feedback

I'd love to hear from you! Get in touch via [mastodon](https://mastodon.social/@mattiem), an issue, or a pull request.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/mattmassicotte/PackageTemplate/actions
[build status badge]: https://github.com/mattmassicotte/PackageTemplate/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/mattmassicotte/PackageTemplate
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmattmassicotte%2FPackageTemplate%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/mattmassicotte/PackageTemplate/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
