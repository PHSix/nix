# 资料
因为在国内使用`nixos`的用户比较少，所以关于`nixos`和`nix`的中文资料都比较少，所以获取资料的来源基本就是官网的三篇`manual`(这三篇是必读的manual，不过顺序比较乱，所以读起来也比较吃力而且难以读懂，对于入门来讲还是都`nix pills`比较方便而且更加容易理解)

中文资料链接：
[nixos使用与开发配置(一个从github上找到的中文issue内容，很好的介绍了如何入门`nix`)](https://github.com/madobet/webooru/issues/136)

[Nix(OS)挖坑笔记(介绍了home-manager这个工具)](https://jishu.io/nixos/home-manager/)

[NixOS 系列（二）：基础配置，Nix Flake，和批量部署](https://lantian.pub/article/modify-website/nixos-initial-config-flake-deploy.lantian/)
官网的manual:

[nix manual](https://nixos.org/manual/nix/stable)

[nixpkgs manual](https://nixos.org/manual/nixpkgs/stable)

[nixos manual](https://nixos.org/manual/nixos/stable)

`NixOS Wiki`的资料(关于flake和home-manager):
[flakes](https://nixos.org/manual/nixos/stable)
[home-manager](https://nixos.wiki/wiki/Home_Manager)
# 关于nixos
`nixos`是一个围绕 `nix` 包管理工具(有些时候甚至可以说是环境管理器了)构建的`gnu/linux`系统. 其相比于其它linux系统有以下一些特点:
1. 申明式（Declarative）：通过使用`Nix`这门语言将系统的一切信息都交托给位于`/etc/nixos`下的配置文件管理，在这个文件中，还声明了各种软件包和软件包的参数，以及系统中对用户的定义也归结到了配置文件中。当用户使用到的一台新电脑的时候，如果想要快速的复原自己的开发环境的时候，只需要分好区然后将自己的配置down下来使用`nixos-install`便可安装一台环境一模一样的电脑。
2. 可回滚（Rollback）：可回滚是指当你当前版本出现BUG无法正常使用时，可以通过`rollback`操作让系统回到上一个版本。
3. 高度可定制性质（Highly Customizable）：这点用过`arch/gentoo`的人都应该十分清楚，`archlinux`和`gentoo linux`都提供了十分强大系统的自定义能力，但是这一切在你的计算机使用过一段时间之后，都不可复现。也就是说，你现在当下的定制化的操作系统，再重新安装系统之后无法轻易的配置成你之前的样子，但是这在`nixos`上是可行的。

像这样配置文件带来的好处就是：
1. 不用再去记什么命令，也不用去记忆什么包名解决了什么问题，因为在你的`Nix`配置文件里面已经描述好的你系统的一切，你需要做的只是：
  1. 把配置文件下载下来（通常是直接用`git`管理）
  2. `nixos-install`
2. 不需要和`archlinux`一样，将所有的`package`都更新到最新得到状态，当然如果想要使用最新版本的包也是可以的。`nixos`不像`arch`，`arch`的策略是将所有的包通过滚动升级到最新版本，让软件和软件之间相互依赖的都是最新版本，这样当有些软件出现了问题就可以直接找到软件的上游去解决。而`nix`是在同一个系统中存在多个不同版本的包，这样做可以很好的解决包和包之间依赖版本的问题。
3. `nixos`和`gentoo`一样，`gentoo`使用`use`来配置编译软件，使得同一个软件在不同用户手中会有多个不同版本的变种，而`nixos`同样也是这个道理，但是`nix`提供了`cache`快速下载二进制（）包的方式，使得用户不需要像`gentoo`用户一样"编译全世界"

# 关于nix
前面说到`nixos`是围绕`nix`工具构建的linux，那么同时，`nix`也可以被用于安装于其他类`unix`系统上。

具体安装方法参考: [nix安装](https://nixos.org/manual/nix/stable/installation/installing-binary.html)

# nix表达式
## 函数式语言
`nix`是一门函数式语言，这意味着它和`haskell`这种函数式编程语言很相像

TODO: grammer和expressions的区别

基本数据类型
- value
- identifier：运算符或其他符号
- string
- list：为列表，集合，像python里面的python
- set:：相当于其他像go，js里面的map，python中的dict
```nix

```
if 表达式
```nix
nix-repl> a = 3
nix-repl> b = 4
nix-repl> if a > b then "yes" else "no"
"no"
```

let 表达式：在nix中，通常使用`let`来定义本地变量，同时因为`nix`是一门`funcitonal programming`，拥有其它函数式编程语言的`Lazy Evaluation`特性，所以他的`let`是惰性的，也就是说`let`语句申明的变量在不使用的时候是不存在，只有在调用的时候才会赋值
```nix
# 其中 in 表示一个调用的函数体
nix-repl> let a = 3; b = 4; in a + b
7
```

with 表达式：
```nix
nix-repl> longName = { a = 3; b = 4; }
nix-repl> longName.a + longName.b
7
nix-repl> with longName; a + b
7
nix-repl> let a = 4; b = a + 5; in b
9
```

惰性带来的好处：
TODO:
```nix
nix-repl> let a = 4; b = a + 5; in b
9
```
TODO: Functions and Import

# derivation

`derivation`在`nix`是一个重要的概念，在`nix pills`里面有这么一句话：
>  Derivations are the building blocks of a Nix system, from a file system view point.

derivation是构建`nix`块的描述文件，

derivation函数需要至少三个参数：
1. name
2. system
3. builder

# nixpkgs
> The Nix Packages collection (Nixpkgs) is a set of thousands of packages for the Nix package manager, released under a permissive MIT/X11 license. Packages are available for several platforms, and can be used with the Nix package manager on most GNU/Linux distributions as well as NixOS.

这里引用官网的`nixpkgs manual`对nixpkgs的介绍。

简单的来讲`nixpkgs`是众多`nix`管理的包的集合，所有的nix安装软件的来源都是`nixpkgs`。

> Nixpkgs is the git repository containing all packages and NixOS modules/expressions.

这里再引用一下`nixos wiki`对`nix channel`的介绍。

如果你用过`debian`或者`manjaro`这种包版本分支概念的发行版，那你应该清楚，这些发行版都提供了不同分支的选择让用户来选择让自己的计算机更加稳定还是更加激进。

`nix`的`channel`同样如此，`nix`通过`channel`来控制用户使用的包的分支(也许这么理解也有点问题？)。

而且channel里面还可以含有非官方的nixpkgs，用户可以通过自己在github或者gitlab的仓库的nixpkgs来安装软件。

现在，我们可以通过使用`nix-channel --list`来查看自己目前的`channel`。
```bash
# 这是我windows上wsl2安装完nix的结果
ph@acer:~$ nix-channel --list
nixpkgs https://nixos.org/channels/nixpkgs-unstable
```


# flakes
> Nix Flakes are an upcoming feature of the Nix package manager.

到目前(nixos21.05)为止`flake`依旧不是一个`stable`的功能，在`nixos`发行的下一个版本可能就会将这个功能给`stable`了。

## flakes是什么？

`flakes`是`nix`官方现在正在推行的一个功能，为的就是让你的configuration.nix具备管理`nixpkgs channel`的功能。具体的安装方法可以参照`NixOS wiki` -> [flakes](https://nixos.wiki/wiki/Flakes)。

## 为什么我们需要flakes？

前面说到，`flakes`的出现是为了让我们的配置文件可以起到管理替代`channel`的功能。那么又有了新的一些问题：

- `channel`的管理方式出现了什么问题？
在前面我说到:
> 当用户使用到的一台新电脑的时候，如果想要快速的复原自己的开发环境的时候，只需要分好区然后将自己的配置down下来使用`nixos-install`便可安装一台环境一模一样的电脑。

然而事实情况是——是但不完全是。

是的我们确实得到了一台软件相同，用户信息相同，软件配置相同的计算机，但是我们使用的软件版本已经不一样了，这个在 [wiki FAQ](https://nixos.wiki/wiki/FAQ) 里面有一个问题问到了

> What are channels and how do they get updated?

这里面说到了，每一个`nixpkgs`分支都会在一段时间过后更新新的软件包版本，虽然`nixos`也是一个有区分包版本的linux发行版，但是它的主分支也是会经常性的更新的，当然其他的linux发行版也是这样的，在一个版本发布过后版本的软件包还是会有一些新的改动和修复新的BUG，这也是我们用ubuntu的时候要使用`apt update && apt upgrade`的原因。

既然有了更新，那我们又是如何保证我们使用同一份配置文件前后相差一个月装在两台计算机上然后还要保证自己使用的软件包和软件库相同呢？这就是所谓不完全相同的地方。

- `flakes`是如何解决这个问题？

如果使用的过`nodejs`的`npm`或者`rust`的`cargo`的就不难理解，这些包管理器通过锁版本来保证项目在不同机器上开发和部署的时候依赖的库版本相同，
进而确保不会出现软件库版本变动导致api变动或者出现新的BUG的问题。
同样的，`flakes`也是这么干的，`flakes`通过每一次执行`nix flake update`来更新或创建一个`flake.lock`文件，里面记录了不同软件源的版本信息，只有当你在`nix flake update`的时候这个文件才有可能会变动。

`flake.lock`记录了当前`nixpkgs`包集合的最新版本，即使再在到后来`nixpkgs`的源相应的软件更新了，基于当前配置文件构建的系统都会是一模一样的。
# home-manager
