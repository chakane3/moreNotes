import { render, screen } from "@testing-library/react";
import RecentDonations from "./RecentDonations";

const donations = [
  {
    amount: 12,
    caption: "Let's all !",
    name: "Apple",
    id: 1,
  },
  {
    amount: 25,
    caption: "Let's all give to!",
    name: "Banana",
    id: 2,
  },
  {
    amount: 50,
    caption: "Let's all give to this great cause!",
    name: "Cherry",
    id: 3,
  },
];

describe("RecentDonations", () => {
  beforeEach(() => {
    render(<RecentDonations donations={donations} />);
  });

  it("renders a heading", () => {
    expect(screen.getAllByRole("heading")[0].textContent).toEqual("Recent Donations");
  });

  it("renders an item for each donation", () => {
    donations.forEach((donation, index) => {
      expect(screen.getAllByRole("listitem")[index].textContent).toEqual(
        [`${donation.name} donated $${donation.amount}`, donation.caption].join("")
      );
    });
  });
});
