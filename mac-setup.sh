#!/bin/sh

# macOS Catalina version 10.15.7

# システム環境設定
	# 省エネ　ディスプレイがオフの時にコンピュータを自動でスリープさせない
	# アクセスビリティ　キーボード　トラックパッドオプション　ドラックを有効にする　３本指ドラッグ
	# キーボード リピート速度　最速　短い
	# トラックパッド　
	# 副ボタンクリック タップ、タップでクリック　１本指
	# スクロール方向　ナチュラル、拡大/縮小、スマートズーム
	# スワイプ 2本3本指でスワイプ、4本指で左右にスワイプ、通知センター、4本指で上にスワイプ、4本指で下にスワイプ、Lanchpad, デスクトップ表示

# ダウンロード関連
# Chrome, iTerm2, Sublime, Spectacle, 

# iTerm2設定
	# かめ　データサイエンティスト　検索
# Sublime　PATH通す
	# SublimeをApplicationに入れたら、ターミナルでパスを通す
	# 初めに＄PATHの確認 /usr/local/binがあることを確認する
	echo $path
	# シンボリックリンク作成
	ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/.

	# /usr/local/binがないと言われたら
	# 実行者権限でbinディレクトリを作り、再度作成
	sudo mkdir /usr/local/bin

	# Permission deniedと言われたら、binディレクトリの所有者を自分に変更し、再度作成
	sudo chown -R $(whoami) /usr/local/bin


# anacondaによる環境構築
	wget https://repo.anaconda.com/archive/Anaconda3-2020.11-MacOSX-x86_64.sh

	# wgetないため、brewでwgetをインストール
	brew install wget

		# brewがないため、homebrewをインストール
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

		# ソフトウェアアップデートサーバから入手できない
		# 再起動してみる->ダメっだった
		# https://developer.apple.com/download/more/から「command line tools」を検索してダウンロード、インストール	OSのversionに注意

	# command line toolsをダウンロードしインストール
	# homebrew install (サイトのコマンドを貼り付けた)
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	brew istall wget
	# 最新のversionを検索してダウンロード
	wget https://repo.anaconda.com/archive/Anaconda3-2020.11-MacOSX-x86_64.sh
	# helpを見てみる
	bash Anaconda3-2020.11-MacOSX-x86_64.sh -h
	# -t インストール後のテストも実施　-p インストールする場所の指定
	bash Anaconda3-2020.11-MacOSX-x86_64.sh -t -p /Users/ionpgmdx4/anaconda3
	# yesを二回程度入力

	conda
		# pathが通っていない場合は再起動

# 普段使っているツールを導入 base環境に作った
conda install -c bioconda samtools #共有ライブラリのシンボリックリンク確認
conda install -c bioconda bedtools
conda install -c bioconda vt
conda install -c bioconda vardict-java #not vardict
conda install -c bioconda snpeff
conda install -c bioconda snpsift
conda install -c bioconda bcftools
conda install -c bioconda htslib #bgzip tabix
# 新しい環境だとbcftoolsでdydl Library not foundとなってしまった

# miniconda (conda-forge, bioconda)が良さそう
conda create xxx 
conda activate xxx
conda --config add-channels bioconda conda-forge
conda install -c bioconda samtools bedtools vt snpeff snpsift bcftools 
	
	# snpseff snpsiftはシンボリックリンク作成する
	ln -s bin/SnpEff snpeff
	ln -s pkgs/snpsift/bin/SnpSift snpsift

# その他ツール
brew install gnu-sed #macの標準sedはBSD版なので少し仕様が異なる gsed便利
# vardictでRが使えないならRをインストール

