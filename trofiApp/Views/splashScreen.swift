//
//  SplashScreen.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI

struct splashScreen: View {
    @Binding var isActive: Bool
    
    var body: some View {
       
        ZStack{
            Color("mainColor").ignoresSafeArea()

            VStack{
                Image("logoTrofi").resizable().scaledToFit()
                    .frame(maxWidth: 250, maxHeight: 250)
//                    .padding(70)
                HStack(content: {
                    Text("track your journey")
                        .padding(.top,10)
                        .font(.custom("DalaFloda-Medium", size: 35, relativeTo: .largeTitle))
                        .foregroundColor(.white)
                })
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }

    }
}
//
//#Preview {
//    splashScreen()
//}





// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {
    };
    objectVersion = 56;
    objects = {
/* Begin PBXBuildFile section */
        2139872A2BFB767C0050214E /* trofiAppApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987292BFB767C0050214E /* trofiAppApp.swift */; };
        2139872C2BFB767C0050214E /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139872B2BFB767C0050214E /* ContentView.swift */; };
        2139872E2BFB767D0050214E /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 2139872D2BFB767D0050214E /* Assets.xcassets */; };
        213987312BFB767D0050214E /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 213987302BFB767D0050214E /* Preview Assets.xcassets */; };
        213987392BFB7B110050214E /* splashScreen.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987382BFB7B110050214E /* splashScreen.swift */; };
        213987462BFB80F60050214E /* dala-floda-medium.ttf in Resources */ = {isa = PBXBuildFile; fileRef = 213987452BFB80F60050214E /* dala-floda-medium.ttf */; };
        213987482BFB91630050214E /* homePage.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987472BFB91630050214E /* homePage.swift */; };
        2139874A2BFB91700050214E /* insightsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987492BFB91700050214E /* insightsView.swift */; };
        2139874C2BFB91910050214E /* galleryView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139874B2BFB91910050214E /* galleryView.swift */; };
        2139874E2BFB919F0050214E /* recipeView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139874D2BFB919F0050214E /* recipeView.swift */; };
        213987662BFB978A0050214E /* BouncyButton.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987632BFB978A0050214E /* BouncyButton.swift */; };
        213987682BFB978A0050214E /* HapticsManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987652BFB978A0050214E /* HapticsManager.swift */; };
        2139876B2BFB97B10050214E /* Model.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139876A2BFB97B10050214E /* Model.swift */; };
        2139876F2BFB98350050214E /* SecondExpandedView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139876C2BFB98350050214E /* SecondExpandedView.swift */; };
        213987712BFB98350050214E /* FirstExpandedView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 2139876E2BFB98350050214E /* FirstExpandedView.swift */; };
        213987722BFB98CF0050214E /* Colors.swift in Sources */ = {isa = PBXBuildFile; fileRef = 213987642BFB978A0050214E /* Colors.swift */; };
        C119C4F32BFB9E81006BF01D /* WidgetKit.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = C119C4F22BFB9E81006BF01D /* WidgetKit.framework */; };
        C119C4F52BFB9E81006BF01D /* SwiftUI.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = C119C4F42BFB9E81006BF01D /* SwiftUI.framework */; };
        C119C4F82BFB9E81006BF01D /* LogDishWidgetBundle.swift in Sources */ = {isa = PBXBuildFile; fileRef = C119C4F72BFB9E81006BF01D /* LogDishWidgetBundle.swift */; };
        C119C4FA2BFB9E81006BF01D /* LogDishWidgetLiveActivity.swift in Sources */ = {isa = PBXBuildFile; fileRef = C119C4F92BFB9E81006BF01D /* LogDishWidgetLiveActivity.swift */; };
        C119C4FC2BFB9E81006BF01D /* LogDishWidget.swift in Sources */ = {isa = PBXBuildFile; fileRef = C119C4FB2BFB9E81006BF01D /* LogDishWidget.swift */; };
        C119C4FE2BFB9E81006BF01D /* AppIntent.swift in Sources */ = {isa = PBXBuildFile; fileRef = C119C4FD2BFB9E81006BF01D /* AppIntent.swift */; };
        C119C5002BFB9E83006BF01D /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = C119C4FF2BFB9E83006BF01D /* Assets.xcassets */; };
        C119C5042BFB9E83006BF01D /* LogDishWidgetExtension.appex in Embed Foundation Extensions */ = {isa = PBXBuildFile; fileRef = C119C4F02BFB9E81006BF01D /* LogDishWidgetExtension.appex */; settings = {ATTRIBUTES = (RemoveHeadersOnCopy, ); }; };
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
        C119C5022BFB9E83006BF01D /* PBXContainerItemProxy */ = {
            isa = PBXContainerItemProxy;
            containerPortal = 2139871E2BFB767C0050214E /* Project object */;
            proxyType = 1;
            remoteGlobalIDString = C119C4EF2BFB9E81006BF01D;
            remoteInfo = LogDishWidgetExtension;
        };
/* End PBXContainerItemProxy section */

/* Begin PBXCopyFilesBuildPhase section */
        C119C5052BFB9E83006BF01D /* Embed Foundation Extensions */ = {
            isa = PBXCopyFilesBuildPhase;
            buildActionMask = 2147483647;
            dstPath = "";
            dstSubfolderSpec = 13;
            files = (
                C119C5042BFB9E83006BF01D /* LogDishWidgetExtension.appex in Embed Foundation Extensions */,
            );
            name = "Embed Foundation Extensions";
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXCopyFilesBuildPhase section */

/* Begin PBXFileReference section */
        213987262BFB767C0050214E /* trofiApp.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = trofiApp.app; sourceTree = BUILT_PRODUCTS_DIR; };
        213987292BFB767C0050214E /* trofiAppApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = trofiAppApp.swift; sourceTree = "<group>"; };
        2139872B2BFB767C0050214E /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
        2139872D2BFB767D0050214E /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        213987302BFB767D0050214E /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
        213987382BFB7B110050214E /* splashScreen.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = splashScreen.swift; sourceTree = "<group>"; };
        213987412BFB7E460050214E /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist; path = Info.plist; sourceTree = "<group>"; };
        213987452BFB80F60050214E /* dala-floda-medium.ttf */ = {isa = PBXFileReference; lastKnownFileType = file; path = "dala-floda-medium.ttf"; sourceTree = "<group>"; };
        213987472BFB91630050214E /* homePage.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = homePage.swift; sourceTree = "<group>"; };
        213987492BFB91700050214E /* insightsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = insightsView.swift; sourceTree = "<group>"; };
        2139874B2BFB91910050214E /* galleryView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = galleryView.swift; sourceTree = "<group>"; };
        2139874D2BFB919F0050214E /* recipeView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = recipeView.swift; sourceTree = "<group>"; };
        213987632BFB978A0050214E /* BouncyButton.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = BouncyButton.swift; sourceTree = "<group>"; };
        213987642BFB978A0050214E /* Colors.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Colors.swift; sourceTree = "<group>"; };
        213987652BFB978A0050214E /* HapticsManager.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = HapticsManager.swift; sourceTree = "<group>"; };
        2139876A2BFB97B10050214E /* Model.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Model.swift; sourceTree = "<group>"; };
        2139876C2BFB98350050214E /* SecondExpandedView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = SecondExpandedView.swift; sourceTree = "<group>"; };
        2139876E2BFB98350050214E /* FirstExpandedView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = FirstExpandedView.swift; sourceTree = "<group>"; };
        C119C4F02BFB9E81006BF01D /* LogDishWidgetExtension.appex */ = {isa = PBXFileReference; explicitFileType = "wrapper.app-extension"; includeInIndex = 0; path = LogDishWidgetExtension.appex; sourceTree = BUILT_PRODUCTS_DIR; };
        C119C4F22BFB9E81006BF01D /* WidgetKit.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = WidgetKit.framework; path = System/Library/Frameworks/WidgetKit.framework; sourceTree = SDKROOT; };
        C119C4F42BFB9E81006BF01D /* SwiftUI.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = SwiftUI.framework; path = System/Library/Frameworks/SwiftUI.framework; sourceTree = SDKROOT; };
        C119C4F72BFB9E81006BF01D /* LogDishWidgetBundle.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LogDishWidgetBundle.swift; sourceTree = "<group>"; };
        C119C4F92BFB9E81006BF01D /* LogDishWidgetLiveActivity.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LogDishWidgetLiveActivity.swift; sourceTree = "<group>"; };
        C119C4FB2BFB9E81006BF01D /* LogDishWidget.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LogDishWidget.swift; sourceTree = "<group>"; };
        C119C4FD2BFB9E81006BF01D /* AppIntent.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppIntent.swift; sourceTree = "<group>"; };
        C119C4FF2BFB9E83006BF01D /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
        C119C5012BFB9E83006BF01D /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
        213987232BFB767C0050214E /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        C119C4ED2BFB9E81006BF01D /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            buildActionMask = 2147483647;
            files = (
                C119C4F52BFB9E81006BF01D /* SwiftUI.framework in Frameworks */,
                C119C4F32BFB9E81006BF01D /* WidgetKit.framework in Frameworks */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
        2139871D2BFB767C0050214E = {
            isa = PBXGroup;
            children = (
                213987282BFB767C0050214E /* trofiApp */,
                C119C4F62BFB9E81006BF01D /* LogDishWidget */,
                C119C4F12BFB9E81006BF01D /* Frameworks */,
                213987272BFB767C0050214E /* Products */,
            );
            sourceTree = "<group>";
        };
        213987272BFB767C0050214E /* Products */ = {
            isa = PBXGroup;
            children = (
                213987262BFB767C0050214E /* trofiApp.app */,
                C119C4F02BFB9E81006BF01D /* LogDishWidgetExtension.appex */,
            );
            name = Products;
            sourceTree = "<group>";
        };
        213987282BFB767C0050214E /* trofiApp */ = {
            isa = PBXGroup;
            children = (
                213987692BFB97920050214E /* Model */,
                213987622BFB976B0050214E /* Manager */,
                213987442BFB80D50050214E /* Fonts */,
                213987412BFB7E460050214E /* Info.plist */,
                213987292BFB767C0050214E /* trofiAppApp.swift */,
                2139872B2BFB767C0050214E /* ContentView.swift */,
                213987372BFB7AED0050214E /* Views */,
                2139872D2BFB767D0050214E /* Assets.xcassets */,
                2139872F2BFB767D0050214E /* Preview Content */,
            );
            path = trofiApp;
            sourceTree = "<group>";
        };
        2139872F2BFB767D0050214E /* Preview Content */ = {
            isa = PBXGroup;
            children = (
                213987302BFB767D0050214E /* Preview Assets.xcassets */,
            );
            path = "Preview Content";
            sourceTree = "<group>";
        };
        213987372BFB7AED0050214E /* Views */ = {
            isa = PBXGroup;
            children = (
                213987382BFB7B110050214E /* splashScreen.swift */,
                213987492BFB91700050214E /* insightsView.swift */,
                2139874D2BFB919F0050214E /* recipeView.swift */,
                2139874B2BFB91910050214E /* galleryView.swift */,
                213987472BFB91630050214E /* homePage.swift */,
                2139876E2BFB98350050214E /* FirstExpandedView.swift */,
                2139876C2BFB98350050214E /* SecondExpandedView.swift */,
            );
            path = Views;
            sourceTree = "<group>";
        };
        213987442BFB80D50050214E /* Fonts */ = {
            isa = PBXGroup;
            children = (
                213987452BFB80F60050214E /* dala-floda-medium.ttf */,
            );
            path = Fonts;
            sourceTree = "<group>";
        };
        213987622BFB976B0050214E /* Manager */ = {
            isa = PBXGroup;
            children = (
                213987632BFB978A0050214E /* BouncyButton.swift */,
                213987642BFB978A0050214E /* Colors.swift */,
                213987652BFB978A0050214E /* HapticsManager.swift */,
            );
            path = Manager;
            sourceTree = "<group>";
        };
        213987692BFB97920050214E /* Model */ = {
            isa = PBXGroup;
            children = (
                2139876A2BFB97B10050214E /* Model.swift */,
            );
            path = Model;
            sourceTree = "<group>";
        };
        C119C4F12BFB9E81006BF01D /* Frameworks */ = {
            isa = PBXGroup;
            children = (
                C119C4F22BFB9E81006BF01D /* WidgetKit.framework */,
                C119C4F42BFB9E81006BF01D /* SwiftUI.framework */,
            );
            name = Frameworks;
            sourceTree = "<group>";
        };
        C119C4F62BFB9E81006BF01D /* LogDishWidget */ = {
            isa = PBXGroup;
            children = (
                C119C4F72BFB9E81006BF01D /* LogDishWidgetBundle.swift */,
                C119C4F92BFB9E81006BF01D /* LogDishWidgetLiveActivity.swift */,
                C119C4FB2BFB9E81006BF01D /* LogDishWidget.swift */,
                C119C4FD2BFB9E81006BF01D /* AppIntent.swift */,
                C119C4FF2BFB9E83006BF01D /* Assets.xcassets */,
                C119C5012BFB9E83006BF01D /* Info.plist */,
            );
            path = LogDishWidget;
            sourceTree = "<group>";
        };
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
        213987252BFB767C0050214E /* trofiApp */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 213987342BFB767D0050214E /* Build configuration list for PBXNativeTarget "trofiApp" */;
            buildPhases = (
                213987222BFB767C0050214E /* Sources */,
                213987232BFB767C0050214E /* Frameworks */,
                213987242BFB767C0050214E /* Resources */,
                C119C5052BFB9E83006BF01D /* Embed Foundation Extensions */,
            );
            buildRules = (
            );
            dependencies = (
                C119C5032BFB9E83006BF01D /* PBXTargetDependency */,
            );
            name = trofiApp;
            productName = trofiApp;
            productReference = 213987262BFB767C0050214E /* trofiApp.app */;
            productType = "com.apple.product-type.application";
        };
        C119C4EF2BFB9E81006BF01D /* LogDishWidgetExtension */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = C119C5082BFB9E83006BF01D /* Build configuration list for PBXNativeTarget "LogDishWidgetExtension" */;
            buildPhases = (
                C119C4EC2BFB9E81006BF01D /* Sources */,
                C119C4ED2BFB9E81006BF01D /* Frameworks */,
                C119C4EE2BFB9E81006BF01D /* Resources */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = LogDishWidgetExtension;
            productName = LogDishWidgetExtension;
            productReference = C119C4F02BFB9E81006BF01D /* LogDishWidgetExtension.appex */;
            productType = "com.apple.product-type.app-extension";
        };
/* End PBXNativeTarget section */

/* Begin PBXProject section */
        2139871E2BFB767C0050214E /* Project object */ = {
            isa = PBXProject;
            attributes = {
                BuildIndependentTargetsInParallel = 1;
                LastSwiftUpdateCheck = 1500;
                LastUpgradeCheck = 1500;
                TargetAttributes = {
                    213987252BFB767C0050214E = {
                        CreatedOnToolsVersion = 15.0.1;
                    };
                    C119C4EF2BFB9E81006BF01D = {
                        CreatedOnToolsVersion = 15.0.1;
                    };
                };
            };
            buildConfigurationList = 213987212BFB767C0050214E /* Build configuration list for PBXProject "trofiApp" */;
            compatibilityVersion = "Xcode 14.0";
            developmentRegion = en;
            hasScannedForEncodings = 0;
            knownRegions = (
                en,
                Base,
            );
            mainGroup = 2139871D2BFB767C0050214E;
            productRefGroup = 213987272BFB767C0050214E /* Products */;
            projectDirPath = "";
            projectRoot = "";
            targets = (
                213987252BFB767C0050214E /* trofiApp */,
                C119C4EF2BFB9E81006BF01D /* LogDishWidgetExtension */,
            );
        };
/* End PBXProject section */
/* Begin PBXResourcesBuildPhase section */
        213987242BFB767C0050214E /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                213987312BFB767D0050214E /* Preview Assets.xcassets in Resources */,
                213987462BFB80F60050214E /* dala-floda-medium.ttf in Resources */,
                2139872E2BFB767D0050214E /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        C119C4EE2BFB9E81006BF01D /* Resources */ = {
            isa = PBXResourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                C119C5002BFB9E83006BF01D /* Assets.xcassets in Resources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
        213987222BFB767C0050214E /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                2139874E2BFB919F0050214E /* recipeView.swift in Sources */,
                213987662BFB978A0050214E /* BouncyButton.swift in Sources */,
                213987392BFB7B110050214E /* splashScreen.swift in Sources */,
                213987712BFB98350050214E /* FirstExpandedView.swift in Sources */,
                2139874A2BFB91700050214E /* insightsView.swift in Sources */,
                2139872C2BFB767C0050214E /* ContentView.swift in Sources */,
                2139872A2BFB767C0050214E /* trofiAppApp.swift in Sources */,
                2139876F2BFB98350050214E /* SecondExpandedView.swift in Sources */,
                213987722BFB98CF0050214E /* Colors.swift in Sources */,
                213987482BFB91630050214E /* homePage.swift in Sources */,
                2139876B2BFB97B10050214E /* Model.swift in Sources */,
                213987682BFB978A0050214E /* HapticsManager.swift in Sources */,
                2139874C2BFB91910050214E /* galleryView.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
        C119C4EC2BFB9E81006BF01D /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            buildActionMask = 2147483647;
            files = (
                C119C4F82BFB9E81006BF01D /* LogDishWidgetBundle.swift in Sources */,
                C119C4FE2BFB9E81006BF01D /* AppIntent.swift in Sources */,
                C119C4FA2BFB9E81006BF01D /* LogDishWidgetLiveActivity.swift in Sources */,
                C119C4FC2BFB9E81006BF01D /* LogDishWidget.swift in Sources */,
            );
            runOnlyForDeploymentPostprocessing = 0;
        };
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
        C119C5032BFB9E83006BF01D /* PBXTargetDependency */ = {
            isa = PBXTargetDependency;
            target = C119C4EF2BFB9E81006BF01D /* LogDishWidgetExtension */;
            targetProxy = C119C5022BFB9E83006BF01D /* PBXContainerItemProxy */;
        };
/* End PBXTargetDependency section */

/* Begin XCBuildConfiguration section */
        213987322BFB767D0050214E /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_ENABLE_OBJC_WEAK = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_STRICT_PROTOTYPES = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN_UNREACHABLE_CODE = YES;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                COPY_PHASE_STRIP = NO;
                DEBUG_INFORMATION_FORMAT = dwarf;
                ENABLE_STRICT_OBJC_MSGSEND = YES;
                ENABLE_TESTABILITY = YES;
                ENABLE_USER_SCRIPT_SANDBOXING = YES;
                GCC_C_LANGUAGE_STANDARD = gnu17;
                GCC_DYNAMIC_NO_PIC = NO;
                GCC_NO_COMMON_BLOCKS = YES;
                GCC_OPTIMIZATION_LEVEL = 0;
                GCC_PREPROCESSOR_DEFINITIONS = (
                    "DEBUG=1",
                    "$(inherited)",
                );
                GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
                GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
                GCC_WARN_UNDECLARED_SELECTOR = YES;
                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
                GCC_WARN_UNUSED_FUNCTION = YES;
                GCC_WARN_UNUSED_VARIABLE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
                MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
                MTL_FAST_MATH = YES;
                ONLY_ACTIVE_ARCH = YES;
                SDKROOT = iphoneos;
                SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
                SWIFT_OPTIMIZATION_LEVEL = "-Onone";
            };
            name = Debug;
        };
        213987332BFB767D0050214E /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_ENABLE_OBJC_WEAK = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_STRICT_PROTOTYPES = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN_UNREACHABLE_CODE = YES;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                COPY_PHASE_STRIP = NO;
                DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
                ENABLE_NS_ASSERTIONS = NO;
                ENABLE_STRICT_OBJC_MSGSEND = YES;
                ENABLE_USER_SCRIPT_SANDBOXING = YES;
                GCC_C_LANGUAGE_STANDARD = gnu17;
                GCC_NO_COMMON_BLOCKS = YES;
                GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
                GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
                GCC_WARN_UNDECLARED_SELECTOR = YES;
                GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
                GCC_WARN_UNUSED_FUNCTION = YES;
                GCC_WARN_UNUSED_VARIABLE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
                MTL_ENABLE_DEBUG_INFO = NO;
                MTL_FAST_MATH = YES;
                SDKROOT = iphoneos;
                SWIFT_COMPILATION_MODE = wholemodule;
                VALIDATE_PRODUCT = YES;
            };
            name = Release;
        };
        213987352BFB767D0050214E /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\"trofiApp/Preview Content\"";
                DEVELOPMENT_TEAM = 42NWXG687M;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = trofiApp/Info.plist;
                INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
                INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
                INFOPLIST_KEY_UILaunchScreen_Generation = YES;
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                );
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = me.jeddin.trofiApp;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Debug;
        };
        213987362BFB767D0050214E /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_ASSET_PATHS = "\"trofiApp/Preview Content\"";
                DEVELOPMENT_TEAM = 42NWXG687M;
                ENABLE_PREVIEWS = YES;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = trofiApp/Info.plist;
                INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
                INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
                INFOPLIST_KEY_UILaunchScreen_Generation = YES;
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                );
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = me.jeddin.trofiApp;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Release;
        };
        C119C5062BFB9E83006BF01D /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME = WidgetBackground;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = 42NWXG687M;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = LogDishWidget/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = LogDishWidget;
                INFOPLIST_KEY_NSHumanReadableCopyright = "";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                    "@executable_path/../../Frameworks",
                );
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = me.jeddin.trofiApp.LogDishWidget;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SKIP_INSTALL = YES;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Debug;
        };
        C119C5072BFB9E83006BF01D /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                ASSETCATALOG_COMPILER_WIDGET_BACKGROUND_COLOR_NAME = WidgetBackground;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = 42NWXG687M;
                GENERATE_INFOPLIST_FILE = YES;
                INFOPLIST_FILE = LogDishWidget/Info.plist;
                INFOPLIST_KEY_CFBundleDisplayName = LogDishWidget;
                INFOPLIST_KEY_NSHumanReadableCopyright = "";
                LD_RUNPATH_SEARCH_PATHS = (
                    "$(inherited)",
                    "@executable_path/Frameworks",
                    "@executable_path/../../Frameworks",
                );
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = me.jeddin.trofiApp.LogDishWidget;
                PRODUCT_NAME = "$(TARGET_NAME)";
                SKIP_INSTALL = YES;
                SWIFT_EMIT_LOC_STRINGS = YES;
                SWIFT_VERSION = 5.0;
                TARGETED_DEVICE_FAMILY = "1,2";
            };
            name = Release;
        };
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
        213987212BFB767C0050214E /* Build configuration list for PBXProject "trofiApp" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                213987322BFB767D0050214E /* Debug */,
                213987332BFB767D0050214E /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        213987342BFB767D0050214E /* Build configuration list for PBXNativeTarget "trofiApp" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                213987352BFB767D0050214E /* Debug */,
                213987362BFB767D0050214E /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
        C119C5082BFB9E83006BF01D /* Build configuration list for PBXNativeTarget "LogDishWidgetExtension" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                C119C5062BFB9E83006BF01D /* Debug */,
                C119C5072BFB9E83006BF01D /* Release */,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
/* End XCConfigurationList section */
    };
    rootObject = 2139871E2BFB767C0050214E /* Project object */;
}
