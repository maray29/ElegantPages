// Kevin Li - 6:11 PM - 6/23/20

import SwiftUI

public struct ElegantHPages<Pages>: View where Pages: View {

    let pagerManager: ElegantPagesManager
    let bounces: Bool
    let pages: PageContainer<Pages>

    public init(pagerManager: ElegantPagesManager,
                bounces: Bool = false,
                @PageViewBuilder builder: () -> PageContainer<Pages>) {
        self.pagerManager = pagerManager
        self.bounces = bounces
        self.pages = builder()
    }

    public var body: some View {
        ElegantPagesView(pagerManager: pagerManager,
                         stackView: HorizontalStack(pages: pages),
                         pageCount: pages.count,
                         isHorizontal: true,
                         bounces: bounces)
    }

}

private struct HorizontalStack<Pages>: View where Pages: View {

    let pages: Pages

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            pages
                .frame(width: screen.width, height: screen.height)
        }
        .frame(width: screen.width, height: screen.height, alignment: .leading)
    }

}